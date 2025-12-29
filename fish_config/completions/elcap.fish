# Fish completions for elcap CLI (v0.3.43)

# Dynamic completion functions
function __fish_elcap_list_serial_ports
    for port in /dev/ttyACM* /dev/ttyUSB*
        test -e $port && echo $port
    end
end

function __fish_elcap_list_device_aliases
    elcap device discover 2>/dev/null | awk 'NR>2 && NF>0 {print $NF}' | grep -v '^\s*$'
end

# Disable file completion by default
complete -c elcap -f

# Global options
complete -c elcap -s v -l verbose -d 'Enable verbose output'
complete -c elcap -s e -l engine -r -f -a 'podman docker native' -d 'Specify the build engine'
complete -c elcap -l help -d 'Show help message and exit'

# Top-level subcommands
complete -c elcap -n __fish_use_subcommand -a about -d 'See information about ElCap'
complete -c elcap -n __fish_use_subcommand -a doctor -d 'Check your environment'
complete -c elcap -n __fish_use_subcommand -a flash -d 'Flash the specified file or the current project'
complete -c elcap -n __fish_use_subcommand -a build -d 'Build the current project'
complete -c elcap -n __fish_use_subcommand -a clean -d 'Delete the current project\'s build artifacts'
complete -c elcap -n __fish_use_subcommand -a new -d 'Create a new project'
complete -c elcap -n __fish_use_subcommand -a image -d 'Manipulate an existing image'
complete -c elcap -n __fish_use_subcommand -a device -d 'Interact with a connected device'
complete -c elcap -n __fish_use_subcommand -a tokens -d 'Configure or modify device tokens'
complete -c elcap -n __fish_use_subcommand -a self -d 'Manage your ElCap installation'
complete -c elcap -n __fish_use_subcommand -a tools -d 'Manage and launch external tools'

# --- doctor ---
complete -c elcap -n '__fish_seen_subcommand_from doctor' -l setup-jlink -d 'Handle JLink dependencies'

# --- flash ---
complete -c elcap -n '__fish_seen_subcommand_from flash' -l usb -r -d 'USB serial number of the JLink device'
complete -c elcap -n '__fish_seen_subcommand_from flash' -l ip -r -d 'IP address of the JLink device'
complete -c elcap -n '__fish_seen_subcommand_from flash' -l alias -r -f -a '(__fish_elcap_list_device_aliases)' -d 'Alias for the JLink device'
complete -c elcap -n '__fish_seen_subcommand_from flash' -l target -r -d 'Flash target'
complete -c elcap -n '__fish_seen_subcommand_from flash' -l file -r -F -d 'File to flash'
complete -c elcap -n '__fish_seen_subcommand_from flash' -l interface -r -f -a 'SWD' -d 'Programming interface'
complete -c elcap -n '__fish_seen_subcommand_from flash' -l speed -r -d 'Programming speed'
complete -c elcap -n '__fish_seen_subcommand_from flash' -l example -d 'Flash a pre-compiled example project'

# --- build ---
complete -c elcap -n '__fish_seen_subcommand_from build' -l clean -d 'Delete all build artifacts'
complete -c elcap -n '__fish_seen_subcommand_from build' -l no-clean -d 'Keep build artifacts'
complete -c elcap -n '__fish_seen_subcommand_from build' -l target -r -d 'Build target'
complete -c elcap -n '__fish_seen_subcommand_from build' -l jobs -r -d 'Maximum number of jobs to spawn'
complete -c elcap -n '__fish_seen_subcommand_from build' -l debug -d 'Enable debug build'
complete -c elcap -n '__fish_seen_subcommand_from build' -l no-debug -d 'Disable debug build'
complete -c elcap -n '__fish_seen_subcommand_from build' -l release -d 'Enable release build'
complete -c elcap -n '__fish_seen_subcommand_from build' -l no-release -d 'Disable release build'
complete -c elcap -n '__fish_seen_subcommand_from build' -l test -d 'Enable test build'
complete -c elcap -n '__fish_seen_subcommand_from build' -l no-test -d 'Disable test build'

# --- new ---
complete -c elcap -n '__fish_seen_subcommand_from new' -l name -r -d 'The human-friendly name of the project'
complete -c elcap -n '__fish_seen_subcommand_from new' -l path -r -F -d 'The path to the project directory'
complete -c elcap -n '__fish_seen_subcommand_from new' -l sdk -r -d 'SDK version'
complete -c elcap -n '__fish_seen_subcommand_from new' -l opts -r -d 'Project options as a JSON string'
complete -c elcap -n '__fish_seen_subcommand_from new' -l dry-run -d 'Don\'t actually create the project'
complete -c elcap -n '__fish_seen_subcommand_from new' -l no-dry-run -d 'Actually create the project'

# --- image subcommands ---
complete -c elcap -n '__fish_seen_subcommand_from image; and not __fish_seen_subcommand_from combine zbota sign' -a combine -d 'Combine multiple files together'
complete -c elcap -n '__fish_seen_subcommand_from image; and not __fish_seen_subcommand_from combine zbota sign' -a zbota -d 'Generate Zigbee OTA image'
complete -c elcap -n '__fish_seen_subcommand_from image; and not __fish_seen_subcommand_from combine zbota sign' -a sign -d 'Sign a project'

# image combine
complete -c elcap -n '__fish_seen_subcommand_from image; and __fish_seen_subcommand_from combine' -l outfile -r -F -d 'Output file to write combined content'

# image zbota
complete -c elcap -n '__fish_seen_subcommand_from image; and __fish_seen_subcommand_from zbota' -s o -l outfile -r -F -d 'Output filename for the OTA file'
complete -c elcap -n '__fish_seen_subcommand_from image; and __fish_seen_subcommand_from zbota' -s m -l mfg-id -r -d 'Manufacturer ID (e.g., 0xABCD)'
complete -c elcap -n '__fish_seen_subcommand_from image; and __fish_seen_subcommand_from zbota' -s i -l image-type -r -d 'Image type identifier (e.g., 0x1234)'
complete -c elcap -n '__fish_seen_subcommand_from image; and __fish_seen_subcommand_from zbota' -s v -l version -r -d 'Version (e.g., 1.0.0.1 or 0x01000001)'
complete -c elcap -n '__fish_seen_subcommand_from image; and __fish_seen_subcommand_from zbota' -s t -l tag -r -d 'Tag specification TAG_ID:FILE_OR_LENGTH'
complete -c elcap -n '__fish_seen_subcommand_from image; and __fish_seen_subcommand_from zbota' -l string -r -d 'Header string text (max 32 chars)'
complete -c elcap -n '__fish_seen_subcommand_from image; and __fish_seen_subcommand_from zbota' -s c -l credentials -r -d 'Security credentials (e.g., 0xFF)'
complete -c elcap -n '__fish_seen_subcommand_from image; and __fish_seen_subcommand_from zbota' -s d -l dest-eui64 -r -d 'Upgrade destination EUI64'
complete -c elcap -n '__fish_seen_subcommand_from image; and __fish_seen_subcommand_from zbota' -l min-hwv -r -d 'Minimum hardware version'
complete -c elcap -n '__fish_seen_subcommand_from image; and __fish_seen_subcommand_from zbota' -l max-hwv -r -d 'Maximum hardware version'
complete -c elcap -n '__fish_seen_subcommand_from image; and __fish_seen_subcommand_from zbota' -l integrity -s ic -d 'Add image integrity code (AES MMO hash)'

# --- device subcommands ---
complete -c elcap -n '__fish_seen_subcommand_from device; and not __fish_seen_subcommand_from discover erase erase-sector tty rename' -a discover -d 'Discover all USB or IP connected programmers'
complete -c elcap -n '__fish_seen_subcommand_from device; and not __fish_seen_subcommand_from discover erase erase-sector tty rename' -a erase -d 'Erase internal flash'
complete -c elcap -n '__fish_seen_subcommand_from device; and not __fish_seen_subcommand_from discover erase erase-sector tty rename' -a erase-sector -d 'Erase specified address range of flash'
complete -c elcap -n '__fish_seen_subcommand_from device; and not __fish_seen_subcommand_from discover erase erase-sector tty rename' -a tty -d 'Connect to device via serial terminal'
complete -c elcap -n '__fish_seen_subcommand_from device; and not __fish_seen_subcommand_from discover erase erase-sector tty rename' -a rename -d 'Assign or update a device alias'

# Common device options (for erase, erase-sector, rename)
complete -c elcap -n '__fish_seen_subcommand_from device; and __fish_seen_subcommand_from erase erase-sector rename' -l usb -r -d 'USB serial number of the JLink device'
complete -c elcap -n '__fish_seen_subcommand_from device; and __fish_seen_subcommand_from erase erase-sector rename' -l ip -r -d 'IP address of the JLink device'
complete -c elcap -n '__fish_seen_subcommand_from device; and __fish_seen_subcommand_from erase erase-sector rename' -l alias -r -f -a '(__fish_elcap_list_device_aliases)' -d 'Alias for the JLink device'
complete -c elcap -n '__fish_seen_subcommand_from device; and __fish_seen_subcommand_from erase erase-sector' -l target -r -d 'Flash target'
complete -c elcap -n '__fish_seen_subcommand_from device; and __fish_seen_subcommand_from erase erase-sector' -l interface -r -f -a 'SWD' -d 'Programming interface'
complete -c elcap -n '__fish_seen_subcommand_from device; and __fish_seen_subcommand_from erase erase-sector' -l speed -r -d 'Programming speed'

# device erase specific
complete -c elcap -n '__fish_seen_subcommand_from device; and __fish_seen_subcommand_from erase' -l all -d 'Erase entire flash (application and token space)'

# device rename specific
complete -c elcap -n '__fish_seen_subcommand_from device; and __fish_seen_subcommand_from rename' -s n -l name -r -d 'New alias to assign to the device'
complete -c elcap -n '__fish_seen_subcommand_from device; and __fish_seen_subcommand_from rename' -l unset -d 'Remove alias/nickname from device'

# device tty
complete -c elcap -n '__fish_seen_subcommand_from device; and __fish_seen_subcommand_from tty' -s p -l port -r -f -a '(__fish_elcap_list_serial_ports)' -d 'Serial port'
complete -c elcap -n '__fish_seen_subcommand_from device; and __fish_seen_subcommand_from tty' -s b -l baudrate -r -f -a '9600 19200 38400 57600 115200 230400 460800 921600' -d 'Baud rate'
complete -c elcap -n '__fish_seen_subcommand_from device; and __fish_seen_subcommand_from tty' -s d -l databits -r -f -a '5 6 7 8' -d 'Data bits'
complete -c elcap -n '__fish_seen_subcommand_from device; and __fish_seen_subcommand_from tty' -s s -l stopbits -r -f -a '1 1.5 2' -d 'Stop bits'
complete -c elcap -n '__fish_seen_subcommand_from device; and __fish_seen_subcommand_from tty' -l parity -r -f -a 'none odd even mark space' -d 'Parity'
complete -c elcap -n '__fish_seen_subcommand_from device; and __fish_seen_subcommand_from tty' -s f -l flow -r -f -a 'none xonxoff rtscts' -d 'Flow control'

# --- tokens subcommands ---
complete -c elcap -n '__fish_seen_subcommand_from tokens; and not __fish_seen_subcommand_from list patch write read erase' -a list -d 'List available APP or MFG token(s)'
complete -c elcap -n '__fish_seen_subcommand_from tokens; and not __fish_seen_subcommand_from list patch write read erase' -a patch -d 'Patch Intel HEX files with data'
complete -c elcap -n '__fish_seen_subcommand_from tokens; and not __fish_seen_subcommand_from list patch write read erase' -a write -d 'Write APP or MFG token(s)'
complete -c elcap -n '__fish_seen_subcommand_from tokens; and not __fish_seen_subcommand_from list patch write read erase' -a read -d 'Read APP or MFG token(s)'
complete -c elcap -n '__fish_seen_subcommand_from tokens; and not __fish_seen_subcommand_from list patch write read erase' -a erase -d 'Erase APP or MFG token(s)'

# Common tokens options
complete -c elcap -n '__fish_seen_subcommand_from tokens; and __fish_seen_subcommand_from list patch write read erase' -l type -r -f -a 'APP MFG' -d 'Token type'
complete -c elcap -n '__fish_seen_subcommand_from tokens; and __fish_seen_subcommand_from list patch write read erase' -l target -r -d 'Target chip PN'
complete -c elcap -n '__fish_seen_subcommand_from tokens; and __fish_seen_subcommand_from list patch write read erase' -l def -r -F -d 'Token definition json file'

# tokens name option (for patch, write, read, erase)
complete -c elcap -n '__fish_seen_subcommand_from tokens; and __fish_seen_subcommand_from patch write read erase' -l name -r -d 'Token name'

# tokens value options (for patch, write)
complete -c elcap -n '__fish_seen_subcommand_from tokens; and __fish_seen_subcommand_from patch write' -l value -r -d 'Value to write/patch'
complete -c elcap -n '__fish_seen_subcommand_from tokens; and __fish_seen_subcommand_from patch write' -l value-type -r -f -a 'ascii int hex' -d 'Token value type'
complete -c elcap -n '__fish_seen_subcommand_from tokens; and __fish_seen_subcommand_from patch write' -l file -r -F -d 'JSON file for multiple tokens'

# tokens device options (for write, read, erase)
complete -c elcap -n '__fish_seen_subcommand_from tokens; and __fish_seen_subcommand_from write read erase' -l usb -r -d 'USB serial number of the JLink device'
complete -c elcap -n '__fish_seen_subcommand_from tokens; and __fish_seen_subcommand_from write read erase' -l ip -r -d 'IP address of the JLink device'
complete -c elcap -n '__fish_seen_subcommand_from tokens; and __fish_seen_subcommand_from write read erase' -l alias -r -f -a '(__fish_elcap_list_device_aliases)' -d 'Alias for the JLink device'

# tokens erase specific
complete -c elcap -n '__fish_seen_subcommand_from tokens; and __fish_seen_subcommand_from erase' -l confirm -d 'Auto-confirm erase all tokens'
complete -c elcap -n '__fish_seen_subcommand_from tokens; and __fish_seen_subcommand_from erase' -l no-confirm -d 'Prompt before erasing'

# --- self subcommands ---
complete -c elcap -n '__fish_seen_subcommand_from self; and not __fish_seen_subcommand_from update repair' -a update -d 'Update your ElCap CLI to the latest version'
complete -c elcap -n '__fish_seen_subcommand_from self; and not __fish_seen_subcommand_from update repair' -a repair -d 'Attempt to repair your ElCap CLI environment'

# --- tools subcommands ---
complete -c elcap -n '__fish_seen_subcommand_from tools; and not __fish_seen_subcommand_from zap' -a zap -d '[DISABLED] Run Zap configuration tool'

# tools zap
complete -c elcap -n '__fish_seen_subcommand_from tools; and __fish_seen_subcommand_from zap' -l generate -d 'Generate ZCL artifacts without opening UI'
complete -c elcap -n '__fish_seen_subcommand_from tools; and __fish_seen_subcommand_from zap' -l no-generate -d 'Open UI without generating'
