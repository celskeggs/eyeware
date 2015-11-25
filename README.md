# eyeware

[Diceware](http://world.std.com/~reinhold/diceware.html) is a popular method of generating a strong passphrase, using random selections from a 7776-word list. **eyeware** is an alternative Diceware word list (`eyeware-wordlist` in the files above), comprised of the most frequently-occuring words in JRR Tolkien's *The Lord of the Rings*.

## The Forging of the List

The standard English Diceware [word list](http://world.std.com/~reinhold/diceware.wordlist.asc) consists, for the most part, of words limited to the lowercase English alphabet. eyeware elevates this tendency to a strict standard. In preparing the word list, capitalized letters were converted to lowercase, diacritics were removed, and words containing non-letter glyphs (such as apostrophes or hyphens) were dropped. Additionally, word length was limited to 3-9 characters.

Subject to these filters, all words that appear two or more times in *The Lord of the Rings* are found in the eyeware word list. Single-occurence words were added, in alphabetical order, until the goal word total was reached.

## The Five Dice

To generate a passphrase with a Diceware word list (see the [official site](http://world.std.com/~reinhold/diceware.html) for full instructions):

- roll five dice (or one die five times) and read them left to right to get a 5-digit number
- find the corresponding word on the list
- repeat until you have [six words](http://world.std.com/~reinhold/dicewarefaq.html#howlong) (for a standard passphrase; seven for a high-value passphrase)
- use the words, in the order you generated them and with spaces between them, as your passphrase

You cannot remove or change the order of any words or characters without compromising the randomness of the passphrase. You can, however, insert new words or characters to make the passphrase easier to remember.

## The Randomness of the Computer

Alternatively, you can generate a passphrase using a computer. This is strongly [cautioned against](http://world.std.com/~reinhold/dicewarefaq.html#computer) but should be sound if properly done. The Diceware author recommends using a slightly longer list (8192 words, to make it a whole power of two) for computer generation; `eyeware8k` (also found in the files above) was created for this purpose.

On Linux, one may run the command `shuf --random-source=/dev/random -r -n 6 < eyeware8k` to obtain a 6-word passphrase from the file "eyeware8k". The source of randomness here is the special file `/dev/random`, a random number generator built into the Linux kernel. It is considered [fully reliable](https://wiki.archlinux.org/index.php/Random_number_generation) for cryptographic generation.
