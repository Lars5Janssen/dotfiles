#!/usr/bin/env scriptisto

// scriptisto-begin
// script_src: src/main.rs
// build_cmd: cargo build --release && strip ./target/release/script
// target_bin: ./target/release/script
// files:
//  - path: Cargo.toml
//    content: |
//     package = { name = "script", version = "0.1.0", edition = "2018"}
// scriptisto-end

use std::{collections::HashMap, process::Command};

fn main() {
    let kb = get_all_info();
    let mut keymap_map: HashMap<String, (String, u32)> = HashMap::new();
    for k in kb {
        if keymap_map.contains_key(&k.active_keymap) {
            let mut c = keymap_map.get(&k.active_keymap).expect("");
            keymap_map.insert(k.active_keymap, (c.0, c.1 + 1));
        } else {
            keymap_map.insert(k.active_keymap, k);
        }
    }
    println!("{:?}", keymap_map);
}

#[derive(Debug)]
struct Keyboard {
    name: String,
    address: String,
    rules: String,
    keymaps: Vec<String>,
    active_keymap: String,
    capsLock: bool,
    numLock: bool,
    main: bool,
}

fn get_all_info() -> Vec<Keyboard> {
    let mut keyboards_all: Vec<Keyboard> = Vec::new();
    let hyprctl_devices = Command::new("hyprctl")
        .arg("devices")
        .output()
        .expect("Could not use hyprctl")
        .stdout;
    let binding = String::from_utf8_lossy(&hyprctl_devices);
    let devices: Vec<&str> = binding.split("\n\n\n").collect();
    let keyboards = devices.get(1).expect("").trim_start_matches("Keyboards:\n");
    let mut iter_keyboards = keyboards.split("Keyboard at ");
    iter_keyboards.next();
    for keyboard in iter_keyboards {
        let mut keyboard_params = keyboard.split("\n");
        let address = keyboard_params.next().expect("");
        let name = keyboard_params.next().expect("").trim();
        let rules = keyboard_params
            .next()
            .expect("")
            .trim_start_matches("\t\t\trules: ");
        let active_keymap = keyboard_params
            .next()
            .expect("")
            .trim_start_matches("\t\t\tactive keymap: ");
        let str_caps = keyboard_params
            .next()
            .expect("")
            .trim_start_matches("\t\t\tcapsLock: ");
        let mut caps = false;
        if str_caps == "yes" {
            caps = true
        }
        let str_numLock = keyboard_params
            .next()
            .expect("")
            .trim_start_matches("\t\t\tnumLock: ");
        let mut numLock = false;
        if str_numLock == "yes" {
            numLock = true
        }
        let str_main = keyboard_params
            .next()
            .expect("")
            .trim_start_matches("\t\t\tmain: ");
        let mut main = false;
        if str_main == "yes" {
            main = true
        }

        let mut rules_iter = rules.split("\"").peekable();
        let mut available_keymaps: Vec<String> = Vec::new();
        while rules_iter.peek().is_some() {
            let rule = rules_iter.next().expect("");
            if rule.trim().starts_with(", l") {
                let rule = rules_iter.next().expect("");
                available_keymaps = rule.split(",").map(|x| x.to_string()).collect();
            }
        }
        let kb = Keyboard {
            name: name.to_string(),
            address: address.to_string(),
            rules: rules.to_string(),
            keymaps: available_keymaps,
            active_keymap: active_keymap.to_string(),
            capsLock: caps,
            numLock: numLock,
            main: main,
        };
        keyboards_all.push(kb);
    }
    keyboards_all
}
