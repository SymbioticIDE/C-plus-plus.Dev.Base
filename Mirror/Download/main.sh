apt_cache=/var/cache/apt/archives/

pkg="~/.uni/mirror/pkg"

old="$pkg/old"

mirror="$pkg/C-plus-plus.Base"

backup_old(){
	mkdir -p $old
	mv $apt_cache/*.deb $old
}

install(){
	if [ ! -f $mirror/*.deb];then
		sudo apt-get install build-essential gcc g++ gdb clang clangd -y
		mkdir -p $mirror
		mv $apt_cache/*.deb $mirror/
	fi
}

main(){
	backup_old
	install
}
