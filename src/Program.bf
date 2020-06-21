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

				bool toUpper = false;

				for (var arg in args)
				{

					if(currentArgs.Contains(arg))
						ErrorDuplicateParameter(arg);

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

							//Specifies that the phrase needs to be up-cased

							//Up-casing needs to be done outside of the switch statement as the phrase is assigned to in the "-c" case and the programme arguments are not rearranged prior to entering the for loop

							toUpper = true;

						default:
							ErrorInvalidParameter(arg);

					}

				}

				if(toUpper)
				{

					//must assign a dynamically allocated string or you'll get a EXCEPTION_ACCESS_VIOLATION when phrase.ToUpper() is called

					phrase = new String(phrase);

					phrase.ToUpper();

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

		static void ErrorDuplicateParameter(String param)
		{

			String errorMessage = new String();

			errorMessage.Concat("Error - Duplicate parameter: ", param, " encountered");

			//Runtime.FatalError(errorMessage);

			OutErrorMessageThenExit(errorMessage);

		}

		static void ErrorInvalidParameter(String param)
		{

			String errorMessage = new String();

			errorMessage.Concat("Error - Invalid parameter: ", param, " encountered");

			//Runtime.FatalError(errorMessage);

			OutErrorMessageThenExit(errorMessage);

		}

		static void OutErrorMessageThenExit(String errorMessage)
		{

			Console.WriteLine(errorMessage);

			//Console.In.Read();

			Exit(1);

		}

		[LinkName("exit")]
		public static extern void Exit(int exitCode);

	}

}
