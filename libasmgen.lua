--libasm by Duxz
--v0.1
--in script lua assembly code generator

asmcode 				= {}

asm 					= {}

asm.x86 				= false
asm.arch.aarch64 		= false
asm.arch.arm 			= false
asm.arch.mips 			= false
asm.arch.x64 			= false
asm.arch.ppc 			= false
asm.arch.ppc64 			= false
asm.arch.SixFiveOOne	= false


PREFIX 					= {}

PREFIX.INFO  			= "[?]"
PREFIX.ERROR 			= "[!]"
PREFIX.DEF				= "[+]"
PREFIX.UNK	 			= "[/]"


function asm.begin(custom)
	if custom then
		table.insert(asmcode,custom)
		table.insert(asmcode,".global _start\n")
		table.insert(asmcode,"\t.text")
		table.insert(asmcode,"_start:\n")
	else
		table.insert(asmcode,".global _start\n")
		table.insert(asmcode,"\t.text")
		table.insert(asmcode,"_start:\n")
	end
end

function asm.setarch(arch)
	if arch == "x86" then
		asm.arch.x86 = true
		print(PREFIX.INFO .."set architecture to 'x86'")
	elseif arch == "x64" then
		asm.arch.x64 = true
		print(PREFIX.INFO .. "set architecture to 'x64'")
	elseif arch == "aarch64" then
		asm.arch.aarch64 = true
		print(PREFIX.INFO .. "set architecture to 'aarch64'")
	elseif arch == "arm" then
		asm.arch.arm = true
		print(PREFIX.INFO .. "set architecture to 'arm'")
	--elseif arch == "mips" then
	--	asm.arch.mips = true
	--	print(PREFIX.INFO .. "set architecture to 'mips'")
	--elseif arch == "ppc" then
	--	asm.arch.ppc = true
	--	print(PREFIX.INFO .. "set architecture to 'ppc'")
	--elseif arch == "ppc64" then
	--	asm.arch.ppc64 = true
	--	print(PREFIX.INFO .. "set architecture to 'ppc64'")
	--elseif arch == "6501" then
	--	asm.arch.SixFiveOOne = true
	--	print(PREFIX.INFO .. "set architecture to '6501'")
	else
		print(PREFIX.ERROR .. "architecture '" .. arch .. "'is not supported by libasm")
	end
end

function asm.desetarch()
	asm.arch.x86 = false
	asm.arch.x64 = false
	asm.arch.arm = false
	asm.arch.aarch64 = false
	--asm.arch.mips = false
	--asm.arch.ppc = false
	--asm.arch.pcc64 = false
end

return asm,asmcode
