#!/usr/bin/env bash

brew_install_cask visual-studio-code

array=$(code --list-extensions)

vscode_install_extension () {
  if ! [[ "${array[*]}" =~ "$1" ]]; then
      code --install-extension $1
  fi
}

#code --install-extension DavidAnson.vscode-markdownlint
#code --install-extension esbenp.prettier-vscode
#code --install-extension formulahendry.docker-explorer
#code --install-extension GrapeCity.gc-excelviewer
#code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
#code --install-extension ria.elastic
#code --install-extension tomoki1207.pdf
vscode_install_extension humao.rest-client
vscode_install_extension ms-azuretools.vscode-docker
vscode_install_extension yzhang.markdown-all-in-one

tee ~/Library/Application\ Support/Code/User/snippets/bash-file-header.code-snippets <<-'EOF' >/dev/null
{
  "Bash File Header": {
    "prefix": [
      "bash"
    ],
    "body": [
      "#!/usr/bin/env bash"
    ]
  }
}
EOF

tee ~/Library/Application\ Support/Code/User/settings.json <<-'EOF' >/dev/null
{
    "workbench.colorTheme": "Default Light+",
    "git.autofetch": true,
    "terminal.integrated.fontFamily": "Hack Nerd Font",
    "files.autoSave": "afterDelay"
}
EOF

tee ~/Library/Application\ Support/Code/User/keybindings.json <<-'EOF' >/dev/null
[
    {
        "key": "shift+cmd+c",
        "command": "-workbench.action.terminal.openNativeConsole",
        "when": "!terminalFocus"
    },
    {
        "key": "shift+cmd+c",
        "command": "editor.action.toggleColumnSelection"
    },
    {
        "key": "shift+cmd+d",
        "command": "-workbench.view.debug",
        "when": "viewContainer.workbench.view.debug.enabled"
    },
    {
        "key": "shift+cmd+d",
        "command": "editor.action.duplicateSelection"
    }
]
EOF
