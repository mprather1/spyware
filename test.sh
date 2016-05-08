read update_software
case $update_software in
  "y")
    echo "Installing Ubuntu Desktop software..."

    echo "Done"
    ;;
  "n")
    echo "Installing Ubuntu Server software..."

    echo "Done!!!"
    ;;
  *.)
    echo "skipping..."
    ;;
esac
