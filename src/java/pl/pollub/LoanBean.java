/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pl.pollub;

import java.io.Serializable;

/**
 *
 * @author Patryk
 */
public class LoanBean implements Serializable{
    
    private double amount;
    private double percentPerYear;
    private double numberOfInstalment;
    private double valueOfInstalment=0;
    private double percentPerMonth;

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public double getPercentPerYear() {
        return percentPerYear;
    }

    public void setPercentPerYear(double percentPerYear) {
        this.percentPerYear = percentPerYear/100;
        this.percentPerMonth=this.percentPerYear/12;
    }

    public double getNumberOfInstalment() {
        return numberOfInstalment;
    }

    public void setNumberOfInstalment(double numberOfInstalment) {
        this.numberOfInstalment = numberOfInstalment;
    }
    
    public double getInstalment(){
        valueOfInstalment=(amount*percentPerMonth)/(1-(1/(Math.pow((1+percentPerMonth),numberOfInstalment))));
        return valueOfInstalment;
    }
   
    
}
