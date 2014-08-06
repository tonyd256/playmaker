import System.Environment
import Data.String.Utils

main = do
  [file] <- getArgs
  contents <- readFile file
  let sections = split "```" contents
  let parsedSections = map parseSection sections
  print (parsedSections !! 1)

parseSection :: String -> (String, String)
parseSection s =
  if startswith "swift" s then do
    let code = join "\\n" (tail (lines s))
    ("swift", code)
  else
    ("markdown", s)

