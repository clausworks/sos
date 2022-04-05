mount_point=/mnt/sos
if [ -z "$1" ]; then
   echo Usage: create_disk.sh filename
   exit -1
fi
sudo dd if=/dev/zero of="$1" bs=512 count=32768
sudo parted "$1" mklabel msdos
sudo parted "$1" mkpart primary fat32 2048s 30720s
sudo parted "$1" set 1 boot on
main_disk=$(losetup -f)
echo Binding main disk on $main_disk
sudo losetup -f "$1"
fs_part=$(losetup -f)
echo Binding Fat32 partition on $fs_part
sudo losetup -f "$1" -o 1048576
sudo mkdosfs -F32 -f 2 $fs_part
sudo mount $fs_part $mount_point
sudo grub-install --root-directory=$mount_point --no-floppy --modules="normal part_msdos ext2 multiboot" $main_disk --target=i386-pc
sudo cp -r root/* $mount_point/
sudo umount $mount_point
sudo losetup -d $main_disk
sudo losetup -d $fs_part
