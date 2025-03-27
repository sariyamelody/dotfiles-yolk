export let data = #{
    for_vcs: LOCAL,
    cool_setting: if SYSTEM.hostname == "foo" { 10 } else { 25 }
};

export let osrs_account_names = #{
    // PKers sometimes google RSNs to attempt to link identities and dox -
    // rev these to prevent this
    main:        reverse_string("RETSISSNERES"),
    gim:         reverse_string("1SorttauQ48"),
    babypure:    reverse_string("soraZfOswaP"),
    moonspure:   reverse_string("rettistnedor"),
};

fn reverse_string(s) {
    let tmp = s.to_blob();
    tmp.reverse();
    return tmp.as_string();
}

export let eggs = #{
    alacritty: #{
        targets: "~/.config/alacritty",
        unsafe_shell_hooks: #{
            post_deploy: "git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes",
            post_undeploy: "[ -d ~/.config/alacritty/themes ] && rm -rf ~/.config/alacritty/themes",
        },
        templates: ["alacritty.yml"],
        enabled: true,
    },
    zsh: #{
        targets: #{
            "zshrc": "~/.zshrc",
        },
        templates: ["zshrc"]
    },
    electron_flags: #{
        targets: #{
            "electron-flags.conf": "~/.config/electron-flags.conf"
        }
    },
    niri: #{
        targets: #{
            "config.kdl": "~/.config/niri/config.kdl"
        },
        templates: ["config.kdl"]
    }
}