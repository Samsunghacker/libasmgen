--libasmgen by Duxz
--v0.1
--in script lua assembly code generator
--fyi i need to either start learning how to do stuff in all of those architectures or have people contrib.
asmcode 			= {}

asm 				= {}

asm.arch.x86 			= false
asm.arch.aarch64 		= false
asm.arch.arm 			= false
asm.arch.mips 			= false
asm.arch.x64 			= false
asm.arch.ppc 			= false
asm.arch.ppc64 			= false
asm.arch.SixFiveOTwo		= false


PREFIX 				= {}

PREFIX.INFO  			= "[?]"
PREFIX.ERROR 			= "[!]"
PREFIX.DEF			= "[+]"
PREFIX.UNK	 		= "[/]"


function asm.gnuAS.begin(custom)
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
	--elseif arch == "6502" then
	--	asm.arch.SixFiveOOne = true
	--	print(PREFIX.INFO .. "set architecture to '6502'")
	else
		print(PREFIX.ERROR .. "architecture '" .. arch .. "'is not supported by libasmgen")
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

function completelyAndUtterlyUseless()
	print("this function is useless!")
end
