#/bin/sh

read -p "Enter the path where you want to save the theme (default: ${HOME}/.config/kitty/): " theme_path

# Use the default path if no path is specified
if [ -z "$theme_path" ]; then
  theme_path="${HOME}/.config/kitty/"
fi

# Create the theme directory if it doesn't exist
mkdir -p "$theme_path"

# Download the theme file
if curl -fLO "https://raw.githubusercontent.com/therealnv6/fakecarbon.conf/main/files/fakecarbon.conf" -o "${theme_path}/current-theme.conf"; then
    # Append the theme file to kitty.conf
    echo 'include current-theme.conf' >> "${theme_path}/kitty.conf"
    echo "Theme downloaded and applied successfully!"
else
    echo "Failed to download the theme file!"
fi
