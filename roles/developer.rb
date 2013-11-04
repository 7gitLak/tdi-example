name "developer"
description "for developer machine"
run_list(
	"recipe[irc]",
	"recipe[chruby::system]"
)


default_attributes(
	"chruby" => {
		"rubies" => {
			"1.9.3-p392" => false,
			"1.9.3-p429" => true
			},
		"default" => "1.9.3-p429"
		}
)
