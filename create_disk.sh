dd if=/dev/zero of="$1" bs=512 count=32768
parted "$1" mklabel msdos
parted "$1" mkpart primary fat32 2048s 30720s
parted "$1" set 1 boot on
main_disk=$(losetup -f)
echo Binding main disk on $main_disk
losetup -f "$1"
fs_part=$(losetup -f)
echo Binding Fat32 partition on $fs_part
losetup -f "$1" -o 1048576
mkdosfs -F32 -f 2 $fs_part
mount $fs_part /mnt/sos
# grub-install
