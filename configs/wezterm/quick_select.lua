return {
	-- emails
	"[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}",
	-- URLs (https/http) - balanced parentheses pattern (more specific, tried first)
	"https?://[%w%.%-]+/?[^%s\"']*%([^%s\"'%(%)]*%)[^%s\"'%(%)]*",
	-- URLs (https/http) - general pattern ending with alphanumeric/slash/closing paren
	"https?://[%w%.%-]+/?[^%s\"'%(%)]*[%w/]",
}
