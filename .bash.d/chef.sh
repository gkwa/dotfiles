function cookbook() {
	cookbook=$1
	chef generate cookbook --email taylormonacelli@gmail.com $cookbook
	rm -rf $cookbook/.delivery/build_cookbook $cookbook/.delivery/config.json
	echo 'remote_file = "https://raw.githubusercontent.com/chef-cookbooks/community_cookbook_tools/master/delivery/project.toml"' \
		>$cookbook/.delivery/project.toml
}
