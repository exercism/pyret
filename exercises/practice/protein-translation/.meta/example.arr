provide: proteins end

include string-dict
import lists as L

codon_mappings = [mutable-string-dict:
  "AUG", "Methionine",
  "UUU", "Phenylalanine",
  "UUC", "Phenylalanine",
  "UUA", "Leucine",
  "UUG", "Leucine",
  "UCU", "Serine",
  "UCC", "Serine",
  "UCA", "Serine",
  "UCG", "Serine",
  "UAU", "Tyrosine",
  "UAC", "Tyrosine",
  "UGU", "Cysteine",
  "UGC", "Cysteine",
  "UGG", "Tryptophan",
  "UAA", "STOP",
  "UAG", "STOP",
  "UGA", "STOP"]

fun proteins(strand):
    proteins-recursive(string-explode(strand), [list: ])
end

fun proteins-recursive(current, acc):
    ask:
    | current.length() == 0 then: acc
    | current.length() < 3 then: raise("Invalid codon")
    | otherwise:
      block:
        codon = current.take(3).join-str("")
        protein = translate-codon(codon)
        ask:
          | protein == "STOP" then: acc
          | otherwise:
            rest = split-at(3, current).suffix
            L.append([list: protein], proteins-recursive(rest, acc))
        end
      end
    end
end


fun translate-codon(codon):
  cases(Option) codon_mappings.get-now(codon):
    | some(a) => a
    | none => raise("Invalid codon")
  end
end
