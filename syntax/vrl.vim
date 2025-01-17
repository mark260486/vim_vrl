" Quit when a syntax file was already loaded.
if exists('b:current_syntax') | finish|  endif

    "   Keywords
    syntax keyword vrlConditional if else then
    syntax keyword vrlBoolean true false
    syntax keyword vrlArrayFunctions append chunks push zip 
    syntax keyword vrlCodecFunctions decode_base16 decode_base64 decode_charset decode_gzip decode_mime_q decode_percent decode_punycode decode_snappy decode_zlib decode_zstd encode_base16 encode_base64 encode_charset encode_gzip encode_json encode_key_value encode_logfmt encode_percent encode_proto encode_punycode encode_snappy encode_zlib encode_zstd 
    syntax keyword vrlCoerceFunctions to_bool to_float to_int to_regex to_string 
    syntax keyword vrlConvertFunctions from_unix_timestamp to_syslog_facility to_syslog_level to_syslog_severity to_unix_timestamp 
    syntax keyword vrlDebugFunctions assert assert_eq log 
    syntax keyword vrlEnrichmentFunctions find_enrichment_table_records get_enrichment_table_record 
    syntax keyword vrlEnumerateFunctions compact filter flatten for_each includes keys length map_keys map_values match_array strlen unflatten unique values 
    syntax keyword vrlEventFunctions get_secret remove_secret set_secret set_semantic_meaning 
    syntax keyword vrlPathFunctions del exists get remove set 
    syntax keyword vrlCryptographyFunctions decrypt encrypt hmac md5 seahash sha1 sha2 sha3 
    syntax keyword vrlIPFunctions ip_aton ip_cidr_contains ip_ntoa ip_ntop ip_pton ip_subnet ip_to_ipv6 ipv6_to_ipv4 is_ipv4 is_ipv6 
    syntax keyword vrlNumberFunctions abs ceil floor format_int format_number mod round 
    syntax keyword vrlObjectFunctions match_datadog_query merge object_from_array unnest 
    syntax keyword vrlParseFunctions parse_apache_log parse_aws_alb_log parse_aws_cloudwatch_log_subscription_message parse_aws_vpc_flow_log parse_bytes parse_cef parse_common_log parse_csv parse_dnstap parse_duration parse_etld parse_glog parse_grok parse_groks parse_influxdb parse_int parse_json parse_key_value parse_klog parse_linux_authorization parse_logfmt parse_nginx_log parse_proto parse_query_string parse_regex parse_regex_all parse_ruby_hash parse_syslog parse_timestamp parse_tokens parse_url parse_user_agent parse_xml 
    syntax keyword vrlRandomFunctions random_bool random_bytes random_float random_int uuid_from_friendly_id uuid_v4 uuid_v7 
    syntax keyword vrlStringFunctions camelcase community_id contains_all downcase ends_with find join kebabcase match match_any parse_float pascalcase redact replace replace_with screamingsnakecase sieve slice snakecase split starts_with strip_ansi_escape_codes strip_whitespace truncate upcase 
    syntax keyword vrlContainsFunction contains[]
    syntax keyword vrlSystemFunctions get_env_var get_hostname get_timezone_name 
    syntax keyword vrlTimestampFunctions format_timestamp now 
    syntax keyword vrlTypeFunctions array bool float int is_array is_boolean is_empty is_float is_integer is_json is_null is_nullish is_object is_regex is_string is_timestamp object string tag_types_externally timestamp 
    syntax keyword vrlChecksumFunctions crc
    syntax keyword vrlKeywords abort as break continue for impl in let loop null return self std this type until use while
    syntax keyword vrlTodo TODO FIXME contained
    
    
    "   Numbers
    syntax match vrlHexNumber   '\<0[xX][_0-9a-fA-F]*\x\>' display
    syntax match vrlOctNumber   '\<0[oO][_0-7]*\o\>' display
    syntax match vrlBinNumber   '\<0[bB][_01]*[01]\>' display
    syntax match vrlNumberError '\<\d[_0-9]*\D\>' display
    syntax match vrlNumberError '\<0[_0-9]\+\>' display
    syntax match vrlNumberError '\<0_x\S*\>' display
    syntax match vrlNumberError '\<0[bBxXoO][_0-9a-fA-F]*_\>' display
    syntax match vrlNumberError '\<\d[_0-9]*_\>' display
    syntax match vrlNumber      '\<\d\>' display
    syntax match vrlNumber      '\<[1-9][_0-9]*\d\>' display
    syntax match vrlNumber      '\<\d[jJ]\>' display
    syntax match vrlNumber      '\<[1-9][_0-9]*\d[jJ]\>' display
    syntax match vrlFloat       '\.\d\%([_0-9]*\d\)\=\%([eE][+-]\=\d\%([_0-9]*\d\)\=\)\=[jJ]\=\>' display
    syntax match vrlFloat       '\<\d\%([_0-9]*\d\)\=[eE][+-]\=\d\%([_0-9]*\d\)\=[jJ]\=\>' display
    syntax match vrlFloat       '\<\d\%([_0-9]*\d\)\=\.\d\=\%([_0-9]*\d\)\=\%([eE][+-]\=\d\%([_0-9]*\d\)\=\)\=[jJ]\=' display
    
    "   Strings
    syntax region vrlString start=+[bB]\='+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=vrlBytesEscape,vrlBytesEscapeError,vrlUniEscape,vrlUniEscapeError,@Spell
    syntax region vrlString start=+[bB]\="+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=vrlBytesEscape,vrlBytesEscapeError,vrlUniEscape,vrlUniEscapeError,@Spell
    syntax region vrlString start=+[bB]\="""+ skip=+\\"+ end=+"""+ keepend contains=vrlBytesEscape,vrlBytesEscapeError,vrlUniEscape,vrlUniEscapeError,vrlDocTest2,vrlSpaceError,@Spell
    syntax region vrlString start=+[bB]\='''+ skip=+\\'+ end=+'''+ keepend contains=vrlBytesEscape,vrlBytesEscapeError,vrlUniEscape,vrlUniEscapeError,vrlDocTest,vrlSpaceError,@Spell
    
    syntax match vrlBytesEscape       +\\[abfnrtv'"\\]+ display contained
    syntax match vrlBytesEscape       '\\\o\o\=\o\=' display contained
    syntax match vrlBytesEscapeError  '\\\o\{,2}[89]' display contained
    syntax match vrlBytesEscape       '\\x\x\{2}' display contained
    syntax match vrlBytesEscapeError  '\\x\x\=\X' display contained
    syntax match vrlBytesEscape       '\\$'
    
    syntax match vrlUniEscape         '\\u\x\{4}' display contained
    syntax match vrlUniEscapeError    '\\u\x\{,3}\X' display contained
    syntax match vrlUniEscape         '\\U\x\{8}' display contained
    syntax match vrlUniEscapeError    '\\U\x\{,7}\X' display contained
    syntax match vrlUniEscape         '\\N{[A-Z ]\+}' display contained
    syntax match vrlUniEscapeError    '\\N{[^A-Z ]\+}' display contained
    
    "   Comments
    syntax match vrlComment '#.*$' display contains=vrlTodo
    
    
    "   Highlighting
    highlight link vrlArrayFunctions Function
    highlight link vrlCodecFunctions Function
    highlight link vrlCoerceFunctions Function
    highlight link vrlConvertFunctions Function
    highlight link vrlDebugFunctions Function
    highlight link vrlEnrichmentFunctions Function
    highlight link vrlEnumerateFunctions Function
    highlight link vrlEventFunctions Function
    highlight link vrlPathFunctions Function
    highlight link vrlCryptographyFunctions Function
    highlight link vrlIPFunctions Function
    highlight link vrlNumberFunctions Function
    highlight link vrlObjectFunctions Function
    highlight link vrlParseFunctions Function
    highlight link vrlRandomFunctions Function
    highlight link vrlStringFunctions Function
    highlight link vrlContainsFunction Function
    highlight link vrlSystemFunctions Function
    highlight link vrlTimestampFunctions Function
    highlight link vrlTypeFunctions Function
    highlight link vrlChecksumFunctions Function
    
    highlight link vrlComment Comment
    highlight link vrlTodo Todo
    
    highlight link vrlConditional Conditional
    highlight link vrlBoolean Boolean
    highlight link vrlLoops Statement
    highlight link vrlKeywords Statement
    
    highlight link vrlNumber Number
    highlight link vrlOctNumber Number
    highlight link vrlBinNumber Number
    highlight link vrlHexNumber Number
    highlight link vrlFloat Float
    highlight link vrlNumberError Error
    
    highlight link vrlString String
    
    let b:current_syntax = 'vrl'