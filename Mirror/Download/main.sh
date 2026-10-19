apt_cache=/var/cache/apt/archives/

pkg="~/.uni/mirror/pkg"

old="$pkg/old"

this="C-plus-plus.Base"

mirror="$pkg/$this"

backup_old(){
	if [ ! -f $apt_cache/*.deb ];then
		mkdir -p $old
		mv $apt_cache/*.deb $old
	fi
}

install(){
	if [ ! -f $mirror/*.deb];then
		sudo apt-get install build-essential gcc g++ gdb clang clangd -y
		mkdir -p $mirror
		mv $apt_cache/*.deb $mirror/
	fi
}

compress(){
	if [ ! -f $pkg/$this.tgz ];then
		cd $pkg
		tar cfvz $this.tgz $this
	fi
}

main(){
	backup_old
	install
	compress
}
