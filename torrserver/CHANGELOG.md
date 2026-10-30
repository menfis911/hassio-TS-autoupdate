# Changelog

## MatriX.147.2 — 2026-10-29

**TorrServer:** `MatriX.147.2`  
**Upstream release:** MatriX.147.2

### Release notes from upstream

## What's Changed
* fix(api): restart DLNA, Bonjour and rutor after resetting settings to defaults by @jayhemnani9910 in https://github.com/YouROK/TorrServer/pull/934
* fix(m3u): attach external tracks only when they carry the whole video name by @jayhemnani9910 in https://github.com/YouROK/TorrServer/pull/935
* fix(subs): match the video name only up to a word boundary by @jayhemnani9910 in https://github.com/YouROK/TorrServer/pull/937
* fix(torrfs): tell torrents with the same title apart in WebDAV and FUSE by @jayhemnani9910 in https://github.com/YouROK/TorrServer/pull/933
* fix(m3u): derive the playlist ETag from its content by @jayhemnani9910 in https://github.com/YouROK/TorrServer/pull/938
* fix(waf): read link-local IPv6 clients with a zone by @jayhemnani9910 in https://github.com/YouROK/TorrServer/pull/944
* fix(waf): match referer rules for IDN hosts in punycode by @jayhemnani9910 in https://github.com/YouROK/TorrServer/pull/943
* fix(api): reject a settings set request without sets by @jayhemnani9910 in https://github.com/YouROK/TorrServer/pull/942
* fix(api): answer a malformed hash with not found instead of a panic by @jayhemnani9910 in https://github.com/YouROK/TorrServer/pull/941


**Full Changelog**: https://github.com/YouROK/TorrServer/compare/MatriX.147.1...MatriX.147.2
