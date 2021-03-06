package tarea5;

import java.io.*;
import java_cup.runtime.*;
import java.util.Scanner;
import java.io.FileReader;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

public class Main {

	public static void main(String[] args) throws FileNotFoundException, IOException {

		System.out.println("ITCR");
		System.out.println("Ing en Computacion");
		System.out.println("Compiladores e Interpretes");
		System.out.println("Prof. Fabian Fallas Moya");
		System.out.println("Tarea 5");
		System.out.println("Carlos Arguello");
		System.out.println("Saul Zamora");
		System.out.println("");
		
		String pascalFlex = "./src/tarea5/pascal.jflex";
		File jflexFile = new File(pascalFlex);

		jflex.Main.generate(jflexFile);

		Symbol sym;
		
		System.out.println("Inserte la direccion del archivo Pascal a tokenizar:");
		
		try {

			Scanner scanner = new Scanner(System.in);
			System.out.flush();
			String filepath = scanner.nextLine();
			scanner.close();

			FileReader fileContents = InputManager.readFile(filepath);

			try {
				PascalLexer lexer = new PascalLexer(fileContents);
				
				while((sym = lexer.next_token()).sym != 0) {
					System.out.println("Token: "+sym.right+", value: "+sym.value);
					TimeUnit.MILLISECONDS.sleep(300);
				}
			} catch (Exception e) {

			}
			// file I/O can potentially generate a FileNotFoundException if the
			// specified file
			// does not exist, and therefore must implement exception handling
			// syntax

		} catch (IOException e) {
			System.err.println("Error With File");
		}

	}

}
