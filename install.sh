#/bin/sh

theme_name="fakecarbon"
read -p "Enter the path where you want to save the theme (default: ${HOME}/.config/kitty/): " theme_path

# Use the default path if no path is specified
if [ -z "$theme_path" ]; then
  theme_path="${HOME}/.config/kitty"
fi

# Create the theme directory if it doesn't exist
mkdir -p "$theme_path"

# Check if current-theme.conf already exists
if [ -e "${theme_path}/${theme_name}.conf" ]; then
  echo "A theme file already exists. Skipping theme download. (did you already call this script?)"
else
    # Download the theme file
    if curl -f "https://raw.githubusercontent.com/therealnv6/fakecarbon.conf/main/files/fakecarbon.conf" --output "${theme_path}/${theme_name}.conf"; then
        echo '# BEGIN_KITTY_THEME' >> "${theme_path}/kitty.conf"
        echo "include ${theme_name}.conf" >> "${theme_path}/kitty.conf"
        echo '# END_KITTY_THEME' >> "${theme_path}/kitty.conf"

        echo "Theme downloaded and applied successfully!"
    else
        echo "Failed to download the theme file!"
    fi
fi
