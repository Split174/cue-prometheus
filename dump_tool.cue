package scripts

import "tool/cli"

//import "encoding/yaml"
import "tool/file"

import ( "tool/exec"
	//import "path"
)

command: dump: {

	// get a list of files
	list: file.Glob & {
		glob: "./values/**/**.cue"
	}

	// comprehend tasks for each file, also an inferred dependency
	for _, filepath in list.files {
		// make a unique key for the tasks per item
		(filepath): {
			// and have locally referenced dependencies
			echo: exec.Run & {
				// note the reference to ask and city here
				cmd: ["cue", "export", "./" + filepath, "--out", "yaml", "-e", "promRule"]
				stdout: string // capture stdout, don't print to the terminal
			}
			read: file.Read & {
				filename: filepath
				contents: string
			}
			print: cli.Print & {
				text: echo.stdout + "---" // an inferred dependency
			}
		}
	}
}
