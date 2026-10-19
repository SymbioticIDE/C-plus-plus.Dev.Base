apt_cache=/var/cache/apt/archives

uni=~/.uni

pkg="$uni/mirror/pkg"

old="$pkg/old"

this="C-plus-plus.Base"

mirror="$pkg/$this"

compress_format=tgz

mirror_arc="$mirror.$compress_format"

backup_old(){
	if [ -f $apt_cache/*.deb ] && [ ! -f $mirror_arc ];then
		mkdir -p $old
		sudo mv $apt_cache/*.deb $old
		sudo chown -R $USER:$USER $old
	fi
}

install(){
	mkdir -p $mirror
	sudo apt-get install build-essential gcc g++ gdb clang clangd -y
}

backup(){
	if [ -f $mirror/*.deb ] && [ ! -f $mirror_arc ];then
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
	#backup
	#compress
}

main
