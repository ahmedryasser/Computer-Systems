package prob0357;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.*;

/**
 * Chapter 3, Problem 57 from <i>Computer Systems</i>.
 *
 * <p>
 * File: <code>Prob0357.java</code>
 *
 * <p>
 * Name:Ahmed Najiub
 *
 * <p>
 * Date: 2/15/2021
 *
 * <p>
 * Assignment: 2
 */
public class Prob0357Main implements ActionListener {

    final JFrame mainWindowFrame;
    final JPanel inputPanel;
    final JLabel label;
    final JTextField textField;
    final JPanel buttonPanel;
    final JButton button;

    public Prob0357Main() {
        // Set up the main window.
        mainWindowFrame = new JFrame("Problem 3.57");
        mainWindowFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        mainWindowFrame.setSize(new Dimension(240, 120));

        // Lay out the label and text field input panel from top to bottom.
        inputPanel = new JPanel();
        inputPanel.setLayout(new BoxLayout(inputPanel, BoxLayout.PAGE_AXIS));
        label = new JLabel("Enter an eight-bit binary number:");
        inputPanel.add(label);
        textField = new JTextField(20);
        inputPanel.add(textField);
        inputPanel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));

        // Lay out the button from left to right.
        buttonPanel = new JPanel();
        buttonPanel.setLayout(new BoxLayout(buttonPanel, BoxLayout.LINE_AXIS));
        buttonPanel.setBorder(BorderFactory.createEmptyBorder(0, 10, 10, 10));
        buttonPanel.add(Box.createHorizontalGlue());
        button = new JButton("Print next ten numbers");
        buttonPanel.add(button);
        buttonPanel.add(Box.createRigidArea(new Dimension(10, 0)));

        // Combine the input panel and the button panel in the main window.
        mainWindowFrame.add(inputPanel, BorderLayout.CENTER);
        mainWindowFrame.add(buttonPanel, BorderLayout.PAGE_END);

        textField.addActionListener(this);
        button.addActionListener(this);

        mainWindowFrame.pack();
        mainWindowFrame.setVisible(true);
        mainWindowFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }

    private static void createAndShowGUI() {
        JFrame.setDefaultLookAndFeelDecorated(true);
        new Prob0357Main();
    }

    public static void main(String[] args) {
        javax.swing.SwingUtilities.invokeLater(Prob0357Main::createAndShowGUI);
    }

    @Override
    public void actionPerformed(ActionEvent event) {
        int[] binNum = new int[8];
        String line = textField.getText();
        if (line.length() == 8) {

            for (int i = 0; i<10; i++){
                int num=line.length()-1;
                if (binNum[num] == 0 ){
                    binNum[num] = 1;
                    for (int f=0; f <=7; f++){
                        System.out.printf("%d", binNum[f]);
                    }
                    System.out.printf("\n");
                    num--;
                }

                else{
                    int j=num;
                    while ( binNum[j] == 1 && j>0){
                        j--;
                    }
                    binNum[j] = 1;
                    for (int f=0; f <=7; f++){
                        System.out.printf("%d", binNum[f]);
                    }
                    System.out.printf("\n");
                    num--;
                }
            }
        } else {
            System.out.print("Enter exactly eight bits.\n");
        }
    }
}
