#!/usr/bin/env scriptisto

// scriptisto-begin
// script_src: src/main.rs
// build_cmd: cargo build --release && strip ./target/release/script
// target_bin: ./target/release/script
// files:
//  - path: Cargo.toml
//    content: |
//     package = { name = "script", version = "0.0.1", edition = "2018"}
//     [dependencies]
//     clap={version="4", features=["derive"]}
// scriptisto-end

use std::{collections::HashMap, process::Command};

fn main() {
    let clients = get_clients();
    for c in clients {
        if let Some(init_class) = c.get("initialClass") {
            if init_class == "kitty" {
                if let Some(kitty_workspace) = c.get("workspace") {
                    if let Some(kitty_pid) = c.get("pid") {
                        let socket = format!("unix:/tmp/kitty-{}", kitty_pid);
                        if kitty_workspace.contains("special:magic") {
                            println!("Kitty with pid {:?} on magic", kitty_pid);
                            Command::new("kitten")
                                .arg("@")
                                .arg("--to")
                                .arg(&socket)
                                .arg("set-background-opacity")
                                .arg("0.2")
                                .output();
                        } else {
                            Command::new("kitten")
                                .arg("@")
                                .arg("--to")
                                .arg(&socket)
                                .arg("load-config")
                                .output();
                        }
                    }
                }
            }
        }
    }
}

fn get_clients() -> Vec<HashMap<String, String>> {
    let clients_utf8 = Command::new("hyprctl")
        .arg("clients")
        .output()
        .expect("failed to query hyprland for clients")
        .stdout;

    let clients = String::from_utf8_lossy(&clients_utf8).to_string();
    let mut clients_list: Vec<HashMap<String, String>> = Vec::new();

    for c in clients.split("\n\n") {
        let mut client_hash: HashMap<String, String> = HashMap::new();

        for line in c.split("\n") {
            if let Some((field, value)) = line.split_once(":") {
                client_hash.insert(field.trim().to_string(), value.trim().to_string());
            }
        }
        clients_list.push(client_hash);
    }
    clients_list
}
