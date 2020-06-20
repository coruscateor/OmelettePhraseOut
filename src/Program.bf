using System;
using System.Collections;

namespace OmelettePhraseOut
{

	class Program
	{

		static void Main(String[] args)
		{

			String phrase = "omelette du fromage ";

			bool writelines = false;

			if(args.Count > 0)
			{

				List<String> currentArgs = scope List<String>();

				for (var arg in args)
				{

					if(currentArgs.Contains(arg))
						FatalErrorDuplicateParameter(arg);

					currentArgs.Add(arg);

					switch(arg)
					{

						case "-c":

							//Correct

							//https://www.urbandictionary.com/define.php?term=Omelette%20du%20fromage

							phrase = "omelette au fromage ";

						case "-l":

							//Writes the phrase on a new line

							writelines = true;

						case "-u":

							//must assign dynamically allocated string or you'll get a EXCEPTION_ACCESS_VIOLATION when phrase.ToUpper() is called

							phrase = new String(phrase);

							phrase.ToUpper();

						default:
							FatalErrorInvalidParameter(arg);

					}

				}

			}

			if(writelines)
			{

				while(true)
				{

					Console.WriteLine(phrase);

				}

			}
			else
			{

				while(true)
				{

					Console.Write(phrase);

				}

			}

		}

		static void FatalErrorDuplicateParameter(String param)
		{

			String errorMessage = new String();

			errorMessage.Concat("Fatal Error - Duplicate parameter: ", param, " encountered");

			Runtime.FatalError(errorMessage);

		}

		static void FatalErrorInvalidParameter(String param)
		{

			String errorMessage = new String();

			errorMessage.Concat("Fatal Error - Invalid parameter: ", param, " encountered");

			Runtime.FatalError(errorMessage);

		}

	}

}
