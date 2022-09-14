lua << EOF
package.loaded['darkside'] = nil
package.loaded['util'] = nil
package.loaded['palette'] = nil
package.loaded['highlights'] = nil

require('util').load()
EOF
