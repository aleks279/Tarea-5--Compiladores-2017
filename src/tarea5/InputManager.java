package tarea5;
import java.io.*;


public class InputManager {
	public static FileReader readFile(String filePath) throws FileNotFoundException, IOException {
		return new FileReader(filePath);
	}
}
