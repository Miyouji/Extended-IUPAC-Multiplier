function IUPAC(n)
	
	local FirstOnes = {
		"", "Single", "Double","Triple","Quadra","Penta","Hexa","Hepta","Octa","Enna",
		"Deca","Undeca","Dodeca","Trideca","Tetradeca","Pentadeca","Hexadeca","Heptadeca","Octadeca","Ennadeca",
		"Icosa","Henicosa","Docosa","Tricosa","Tetracosa","Pentacosa","Hexacosa","Heptacosa","Octacosa","Ennacosa",
		"Triaconta","Untriaconta", "Dotriaconta","Tritriaconta","Tetratriaconta","Pentatriaconta","Hexatriaconta","Heptatriaconta","Octatriaconta","Ennatriaconta",
		"Tetraconta","Untetraconta", "Dotetraconta", "Tritetraconta","Tetratetraconta","Pentatetraconta","Hexatetraconta","Heptatetraconta","Octatetraconta","Ennatetraconta",
		"Pentaconta","Henpentaconta","Dopentaconta","Tripentaconta","Tetrapentaconta","Pentapentaconta","Hexapentaconta","Heptapentaconta","Octapentaconta","Ennapentaconta",
		"Hexaconta","Unhexaconta", "Dohexaconta", "Trihexaconta","Tetrahexaconta","Pentahexaconta","Hexahexaconta","Heptahexaconta","Octahexaconta","Ennahexaconta",
		"Heptaconta","Unheptaconta", "Doheptaconta", "Triheptaconta","Tetraheptaconta","Pentaheptaconta","Hexaheptaconta","Heptaheptaconta","Octaheptaconta","Ennaheptaconta",
		"Octaconta","Unoctaconta", "Dooctaconta", "Trioctaconta","Tetraoctaconta","Pentaoctaconta","Hexaoctaconta","Heptaoctaconta","Octaoctaconta","Ennaoctaconta",
		"Ennaconta","Unennaconta", "Doennaconta", "Triennaconta","Tetraennaconta","Pentaennaconta","Hexaennaconta","Heptaennaconta","Octaennaconta","Ennaennaconta"
	}

	local SubFirstOnes = {
		"", "Mono", "Di","Tri","Tetra","Penta","Hexa","Hepta","Octa","Enna",
		"Deca","Undeca","Dodeca","Trideca","Tetradeca","Pentadeca","Hexadeca","Heptadeca","Octadeca","Ennadeca",
		"Icosa","Henicosa","Docosa","Tricosa","Tetracosa","Pentacosa","Hexacosa","Heptacosa","Octacosa","Ennacosa",
		"Triaconta","Untriaconta", "Dotriaconta","Tritriaconta","Tetratriaconta","Pentatriaconta","Hexatriaconta","Heptatriaconta","Octatriaconta","Ennatriaconta",
		"Tetraconta","Untetraconta", "Dotetraconta", "Tritetraconta","Tetratetraconta","Pentatetraconta","Hexatetraconta","Heptatetraconta","Octatetraconta","Ennatetraconta",
		"Pentaconta","Henpentaconta","Dopentaconta","Tripentaconta","Tetrapentaconta","Pentapentaconta","Hexapentaconta","Heptapentaconta","Octapentaconta","Ennapentaconta",
		"Hexaconta","Unhexaconta", "Dohexaconta", "Trihexaconta","Tetrahexaconta","Pentahexaconta","Hexahexaconta","Heptahexaconta","Octahexaconta","Ennahexaconta",
		"Heptaconta","Unheptaconta", "Doheptaconta", "Triheptaconta","Tetraheptaconta","Pentaheptaconta","Hexaheptaconta","Heptaheptaconta","Octaheptaconta","Ennaheptaconta",
		"Octaconta","Unoctaconta", "Dooctaconta", "Trioctaconta","Tetraoctaconta","Pentaoctaconta","Hexaoctaconta","Heptaoctaconta","Octaoctaconta","Ennaoctaconta",
		"Ennaconta","Unennaconta", "Doennaconta", "Triennaconta","Tetraennaconta","Pentaennaconta","Hexaennaconta","Heptaennaconta","Octaennaconta","Ennaennaconta"
	}

	local SecondOnes = {
		"", "Hecta", "Dicta", "Tricta", "Tetracta", "Pentacta", "Hexacta", "Heptacta", "Octacta", "Ennacta"
	}

	local MultOnes = {
		"", "lia", "mega", "giga", "tera", "peta", "exa", "zetta", "yotta", "wekka", "ronna", "quetta"
	}
	
	
	if type(n) == "number" then
		n = math.floor(n)
		if n >= 10^((#MultOnes*3)) then
			return "#" .. s.Comma(n)
		else	
			local function getnum(nm)
				if nm and tonumber(nm) then
					local Hundreds = math.floor(nm/100)
					nm = math.fmod(nm, 100)
					local Ones = math.floor(nm)
					
					if SecondOnes[Hundreds + 1] == "" then 	
					else		
						return SecondOnes[Hundreds + 1] .. string.lower(SubFirstOnes[Ones + 1]) 	
					end 			

					return SecondOnes[Hundreds + 1] .. FirstOnes[Ones + 1]
				end
			end

			local function getnum2(nm)
				if nm and tonumber(nm) then
					local Hundreds = math.floor(nm/100)
					nm = math.fmod(nm, 100)
					local Ones = math.floor(nm)

					if SecondOnes[Hundreds + 1] == "" then 	
					else		
						return string.lower(SecondOnes[Hundreds + 1]) .. string.lower(SubFirstOnes[Ones + 1]) 	
					end 			

					return string.lower(SecondOnes[Hundreds + 1]) .. string.lower(SubFirstOnes[Ones + 1])
				end
			end
			
			if n < 1e3 then
				return getnum(n)
			end
			
			local sn = n
			local txt = ""
			local multtxt = ""
			for i=#MultOnes,0,-1 do
				if sn >= 10^(i*3) then -- SNumber
					txt ..= getnum2(math.floor(sn / 10^(i*3))- 0)
					if i + 1 == 1 then
						multtxt = MultOnes[i + 1]
					else
						if txt == "" then
							multtxt = MultOnes[i + 1] .. ""
						else
							multtxt = MultOnes[i + 1] .. ""
						end
					end
					txt = txt .. multtxt

					sn = math.fmod(sn, 10^(i*3))
				end
			end
			
			return (txt:gsub("^%l", string.upper)) .. " (" .. s.Comma(n) ..")"
		end
	end
end
