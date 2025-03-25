export let data = #{
    for_vcs: LOCAL,
    cool_setting: if SYSTEM.hostname == "foo" { 10 } else { 25 }
};

export let eggs = #{
    alacritty: #{
        targets: "~/.config/alacritty",
        unsafe_shell_hooks: #{
            post_deploy: "git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes"
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