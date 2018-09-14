
echo
echo "Installing tools for Android."
echo "Need to manually install Android SDK/BuildTools/Emulator later."

brew cask install android-studio

echo "export ANDROID_HOME=$HOME/Library/Android/sdk" >> $HOME/.bash_profile
echo "export PATH=$PATH:$ANDROID_HOME/tools" >> $HOME/.bash_profile
echo "export PATH=$PATH:$ANDROID_HOME/tools/bin" >> $HOME/.bash_profile
echo "export PATH=$PATH:$ANDROID_HOME/platform-tools" >> $HOME/.bash_profile