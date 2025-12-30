#!/bin/bash

echo "🔍 Locating Conda installation..."
CONDA_PATH=$(which conda)

if [ -z "$CONDA_PATH" ]; then
    echo "❌ Conda not found in PATH. Please add Conda manually."
    exit 1
fi

echo "✔ Conda found at: $CONDA_PATH"

CONDA_HOME=$(dirname $(dirname $CONDA_PATH))
echo "✔ Conda Home: $CONDA_HOME"

echo "🔁 Initializing Conda for Bash..."
conda init bash
source ~/.bashrc

echo "📋 Listing Conda environments..."
ENVS=$(conda env list | awk 'NR>2 {print $1}' | sed '/^$/d')

echo "🧠 Installing IPython kernel for each environment..."
for env in $ENVS
do
    conda activate $env
    python -m ipykernel install --user --name "$env" --display-name "$env"
    echo "✔ Kernel installed for: $env"
done

echo "⚙ Configuring VS Code Python settings..."
mkdir -p ~/.config/Code/User
SETTINGS=~/.config/Code/User/settings.json

# Backup existing settings if exist
if [[ -f "$SETTINGS" ]]; then
    cp "$SETTINGS" "$SETTINGS.bak_$(date +%s)"
fi

cat <<EOF > $SETTINGS
{
    "python.condaPath": "$CONDA_PATH",
    "python.defaultInterpreterPath": "$CONDA_HOME/bin/python",
    "python.terminal.activateEnvironment": true,
    "python.autoComplete.addBrackets": true
}
EOF

echo "✔ VS Code settings updated!"

echo "🔄 Reload VS Code for changes to take effect."
echo "Done! 🎉 All Conda environments should now appear in VS Code."

