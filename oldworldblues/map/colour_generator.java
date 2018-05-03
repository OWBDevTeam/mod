import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;
import java.util.Random;

public class colour_generator {
	public static final int NUM_COLOURS_TO_GENERATE = 1000;

	public static void main(String[] args) {
		ArrayList<int[]> existingProvinces = new ArrayList<int[]>();
		int[][] generatedProvinces = new int[NUM_COLOURS_TO_GENERATE][3];
		try {
			Scanner scanner = new Scanner(new File("definition.csv"));
			while (scanner.hasNextLine()) {
				String thisLine = scanner.nextLine();
				if (thisLine.trim().isEmpty() || !Character.isDigit(thisLine.charAt(0))) {
					continue;
				}
				String[] thisLineArray = thisLine.split(";");
				try {
					existingProvinces.add(new int[] { Integer.parseInt(thisLineArray[1]),
							Integer.parseInt(thisLineArray[2]), Integer.parseInt(thisLineArray[3]) });
				} catch (NumberFormatException e) {
					System.err.println(e);
				}
			}

			scanner.close();
		} catch (FileNotFoundException e) {
			System.err.println(e);
		}
		Random randomGenerator = new Random();
		int[] generatedProvince;
		outerLoop: for (int i = 0; i < NUM_COLOURS_TO_GENERATE; i++) {
			generatedProvince = new int[] { randomGenerator.nextInt(255), randomGenerator.nextInt(255),
					randomGenerator.nextInt(255) };
			for (int[] alreadyGeneratedProvince : generatedProvinces) {
				if (Arrays.equals(alreadyGeneratedProvince, generatedProvince)) {
					i--;
					continue outerLoop;
				}
			}
			for (int[] existingProvince : existingProvinces) {
				if (Arrays.equals(existingProvince, generatedProvince)) {
					i--;
					continue outerLoop;
				}
			}

			generatedProvinces[i] = generatedProvince;
		}
		String compiledOutput = "GIMP Palette";
		compiledOutput += "\nName: Generated Map Colours";
		compiledOutput += "\nColumns: 16\n";
		int row = 0;
		int column = 0;
		for (int[] province : generatedProvinces) {
			String thisLine = "";
			for (int colour : province) {
				thisLine += String.format("%4.4s", String.valueOf(colour));
			}
			thisLine = thisLine.substring(1);
			thisLine += "        " + String.format("%1$-3.3s %2$s", String.valueOf(row) + ",", String.valueOf(column))
					+ "\n";
			row++;
			if (column >= 14) {
				column = 0;
			} else {
				column += 2;
			}
			compiledOutput += thisLine;
		}
		System.out.println(compiledOutput);
		try {
			PrintWriter printWriter = new PrintWriter(new File("unique_colours.gpl"));
			printWriter.write(compiledOutput);
			printWriter.close();
		} catch (FileNotFoundException e) {

		}
	}

}
