/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package stringcomparator;

import java.io.*;
import javax.swing.JOptionPane;

/**
 *
 * @author vgrki
 */
public class StringComparator {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String cadenaTxt = "";

        try (
                FileReader fr = new FileReader("src/prueba.txt")) {
            int valor = fr.read();
            while (valor != -1) {
                cadenaTxt = cadenaTxt + (char) valor;
                valor = fr.read();
            }
            System.out.println(cadenaTxt);

        } catch (IOException e) {
            System.out.println("Error E/S: " + e);
        }

        for (int i = 0; i < 3; ++i) {

            String str = JOptionPane.showInputDialog("Ingrese el String a buscar", null);
            int prompterStr = 0;
            int prompterTxt = 0;
            int prevPrompterStr = 0; 
            int counter = 0;

            while (cadenaTxt.length() > prompterTxt) {
                char txtCarac = cadenaTxt.charAt(prompterTxt);
                char strCarac = str.charAt(prompterStr);
                char prevStrCarac = str.charAt(prevPrompterStr);
                if (txtCarac != strCarac) {
                    if (txtCarac == prevStrCarac) {
                        prompterTxt++;
                    } else {
                        prompterTxt++;
                        prompterStr = 0;
                    }
                } else {
                    prevPrompterStr=prompterStr; 
                    prompterTxt++;
                    prompterStr++;
                    
                    if (prompterStr == str.length()) {
                        counter++;
                        prompterStr = 0;
                    }
                }
            }

            System.out.println(counter);

        }

    }

}
