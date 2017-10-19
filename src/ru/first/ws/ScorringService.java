package ru.first.ws;

import javax.jws.WebService;
import java.sql.*;
import java.util.logging.*;
import java.util.Date;
import java.util.Calendar;

@WebService(endpointInterface = "ru.first.ws.ScorringInterface")


public class ScorringService implements ScorringInterface{
    @Override
    public String searchExistScore(String firstName, String lastName, String phoneNumber)
    {
        StringBuffer result = new StringBuffer("<table border=\"1\" cellpadding=\"7\" cellspacing=\"0\">\n" +
                "<tr>\n"+
                "<td <valign=\"top\" align=\"center\"> Name </td>\n" +
                "<td <valign=\"top\" align=\"center\"> LastName </td>\n" +
                "<td <valign=\"top\" align=\"center\"> PhoneNumber </td>\n" +
                "<td <valign=\"top\" align=\"center\"> Date </td>\n" +
                "<td <valign=\"top\" align=\"center\"> Status </td>\n" +
                "<td <valign=\"top\" align=\"center\"> Link? </td>\n" +
                "</tr>\n" +
                "</table>\n");

        Connection connection = null;
        String url = "jdbc:oracle:thin:@localhost:1521/XE";
        String name = "scoring";
        String password = "oracle";
        try {
            System.out.println("Попытка соединения с:" + url + " | " + name + " | " + password);
            Class.forName("oracle.jdbc.OracleDriver");
            connection = DriverManager.getConnection(url, name, password);
            if(connection.isValid(5000)) System.out.println("Соединение установлено");
            Statement statement = null;
            statement = connection.createStatement();
            ResultSet qResult = statement.executeQuery(
                    "SELECT * FROM PERSON where name =`" + firstName + "` and last_name = `" +
                         lastName + "` and phone_number = `" + phoneNumber +"`;");
            System.out.println("Запрос выполнен");
            while (qResult.next()) {
                result.insert(result.indexOf("</table>"),
                        "<tr>\n" +
                         "<td <valign=\"top\" align=\"center\">" +
                                qResult.getString("name") + "</td>\n" +
                         "<td <valign=\"top\" align=\"center\">" +
                                qResult.getString("last_name") + "</td>\n" +
                         "<td <valign=\"top\" align=\"center\">" +
                                qResult.getString("phone_number") + "</td>\n" +
                         "<td <valign=\"top\" align=\"center\">" +
                                qResult.getString("last_name") + "</td>\n" +
                         "<td <valign=\"top\" align=\"center\">" +
                                qResult.getString("last_name") + "</td>\n" +
                         "<td <valign=\"top\" align=\"center\"> Link? </td>\n" +
                         "</tr>\n");
            }
                //statement.executeUpdate(
                //      "INSERT INTO users(username) values('name')");
        }
        catch (Exception ex) {
            Logger.getLogger(ScorringService.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ScorringService.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        String sResult = new String(result);
        return sResult;
    }

    public String calculate(
            String name,            //no
            String lastName,        //no
            String phoneNumber,     //no
            Boolean sex,            //male=1 -> +15 , female=0 -> +1
            String birthday,        //18-25 -> +10 , 25-35 -> +20 , 35-45 -> +15 , >45 -> +5
            Long monthlyIncome,     //<10k -> +1, 10-20k -> +22, 20-40k -> +44, 40-80k -> +66, >80k -> +88
            Integer passportSeries, //no
            Long passportNumber,    //no
            String address,         //no
            Integer houseType,      //rental=0 -> +5 , community=1 -> +1 , own=2 -> +20 ,
                                    //business=3 -> + 10 , other=4 -> +1
            Integer familyStatus,   //married=0 -> +10 , single=1 -> +20 , divorced=2 -> +10 ,
                                    //widow=3 -> +20, civil=4 -> +5
            Integer childrenAmount, //0 -> +30, 1-2 -> +20, 3-5 -> +7, >5 -> +1
            Integer education,      //high=0 -> +28, academic=1 -> +15, spec_technic=2 -> +12, medium_tech=3 -> +10,
                                    //medium=4, -> +8, low=5 -> +2, no=6 -> +1
            Integer socialStatus,   //work=0 -> +25, stud=1 -> +3, pens=2 -> +12, business=3 -> +20,
                                    //state=4 -> +30, homebody=5 -> +1
            Integer activity,       //none=0 -> +1, domestic=1 -> +5, state=2 -> +8, military/police=3 -> +22,
                                    //health=4 -> +10, IT=5 -> +1, industry=6 -> +14, science=7 -> +10,
                                    //buisness=8, +25, show=9 -> +19, finance/lawyer=10 -> +21, sport=11 -> +5
                                    //other=12 -> +7
            Integer workPost,       //jr=0 -> +4, spec=1 -> +8, senior=2 -> +16, chief=3 -> +22, high_chief=4 -> +34
            Integer experience,     //<3 -> +7, 3-10 -> +22, >10 -> +26
            Long costs,             //<10k -> +33, 10-20 -> +21, 20-40 -> +10, >40 -> +1
            Integer creditTerm,     //<3 -> +33, 3-5 -> +22, >5 -> +11
            Boolean immovables,     //0 -> +1, 1 -> +33
            Integer immovablesType, //country=0 -> +10, garage=1, -> +8, apartament=2 -> +15, other=3 -> +3
            Boolean car,            //0 -> +1, 1-> +22
            String carMark,         //?
            Integer autoYear,       //<5 -> +20, 5-10 -> +14, >10 -> +7
            Boolean additionalIncome,       //0 -> +1, 1 -> +10
            Integer additionalIncomeType,   //alimony=0 -> +10, insurance=1 -> +8, houseWork=2 -> +6, benefit=3 -> +10
                                            //lease=4 -> +21, other=5 -> +3
            Long additionalIncomeSumm,      //<5k -> +6, 5-15k -> +18, 15-30k -> +31, 30-50k -> +45, >50k -> +67
            Boolean effectiveCredit,        //0 -> +30, 1 -> +1
            Long effectiveCreditSumm        //<10k -> +33, 10-20k -> +11, 20-40k -> +6, >40k -> +1
    )
    {
        Integer result = 0;

        Calendar calendar = Calendar.getInstance(java.util.TimeZone.getDefault(), java.util.Locale.getDefault());
        calendar.setTime(new Date());
        Integer currentYear = calendar.get(Calendar.YEAR);
        Integer currentDay = calendar.get(Calendar.DAY_OF_MONTH);
        Integer currentMonth = calendar.get(Calendar.MONTH);

        try {
            // SEX ------------------ male=1 -> +15 , female=0 -> +1
            if (sex) result += 15;
            else result += 1;
            System.out.println("stage: Sex. Result = " + result);

            // AGE ------------------ 18-25 -> +10 , 25-35 -> +20 , 35-45 -> +15 , >45 -> +5
            Integer years = currentYear - Integer.parseInt(birthday.substring(0,1));
            Integer months = currentMonth - Integer.parseInt(birthday.substring(3,4));
            Integer days = currentDay - Integer.parseInt(birthday.substring(6,7));
            if(days < 0 && months == 0) months--;
            if (months < 0) years--;

            if (years < 18){
                result = 0;
                return "fuck off, kinder";
            } else if (years < 25) result += 10;
                else if (years < 35) result += 20;
                    else if (years < 45) result += 15;
                        else result += 5;
            System.out.println("stage: Age. Result = " + result);

            // MONTHLY_INCOME ------------------ <10k -> +1, 10-20k -> +22, 20-40k -> +44, 40-80k -> +66, >80k -> +88
            result += Math.round(monthlyIncome / 10000) + Math.round(monthlyIncome / 1000);

            // HOUSE_TYPE ------------------ //rental=0 -> +5 , community=1 -> +1 , own=2 -> +20,
            // business=3 -> + 10 , other=4 -> +1
            switch (houseType) {
                case 0: result += 5;
                case 1: result += 1;
                case 2: result += 20;
                case 3: result += 10;
                case 4: result += 1;
            }
            System.out.println("stage: HouseType. Result = " + result);

            // FAMILY_STATUS ------------------ married=0 -> +10 , single=1 -> +20 , divorced=2 -> +10 ,
            // widow=3 -> +20, civil=4 -> +5
            switch (familyStatus) {
                case 0: result += 10;
                case 1: result += 20;
                case 2: result += 10;
                case 3: result += 20;
                case 4: result += 5;
            }
            System.out.println("stage: FAMILY_STATUS. Result = " + result);

            //CHILDREN_AMOUNT ------------------ 0 -> +30, 1-2 -> +20, 3-5 -> +7, >5 -> +1
            if (childrenAmount == 0) result += 30;
                else if (childrenAmount <= 2) result += 20;
                    else if (childrenAmount <= 5) result += 7;
                        else result += 1;
            System.out.println("stage: ChildrenAmount. Result = " + result);

            // EDUCATION ------------------ high=0 ->+28, academic=1 ->+15, spec_technic=2 -> +12, medium_tech=3 -> +10,
            // medium=4, -> +8, low=5 -> +2, no=6 -> +1
            switch (education) {
                case 0: result += 28;
                case 1: result += 15;
                case 2: result += 12;
                case 3: result += 10;
                case 4: result += 8;
                case 5: result += 2;
                case 6: result += 1;
            }
            System.out.println("stage: Education. Result = " + result);

            //SOCIAL_STATUS ------------------ work=0 -> +25, stud=1 -> +3, pens=2 -> +12, business=3 -> +20,
            // state=4 -> +30, homebody=5 -> +1
            switch (socialStatus) {
                case 0: result += 25;
                case 1: result += 3;
                case 2: result += 12;
                case 3: result += 20;
                case 4: result += 30;
                case 5: result += 1;
            }
            System.out.println("stage: SocialStatus. Result = " + result);

            // ACTIVITY ------------------ none=0 -> +1, domestic=1 -> +5, state=2 -> +8, military/police=3 -> +22,
            // health=4 -> +10, IT=5 -> +1, industry=6 -> +14, science=7 -> +10,
            // buisness=8 -> +25, show=9 -> +19, finance/lawyer=10 -> +21, sport=11 -> +5, other=12 -> +7
            switch (activity) {
                case 0: result += 1;
                case 1: result += 5;
                case 2: result += 8;
                case 3: result += 22;
                case 4: result += 10;
                case 5: result += 1;
                case 6: result += 14;
                case 7: result += 10;
                case 8: result += 25;
                case 9: result += 19;
                case 10: result += 21;
                case 11: result += 5;
                case 12: result += 7;
            }
            System.out.println("stage: Activity. Result = " + result);

            // WORK_POST ------------------ jr=0 -> +4, spec=1 ->+8, senior=2 ->+16, chief=3 ->+22, high_chief=4 -> +34
            switch (workPost) {
                case 0: result += 4;
                case 1: result += 8;
                case 2: result += 16;
                case 3: result += 22;
                case 4: result += 34;
            }
            System.out.println("stage: WorkPost. Result = " + result);

            // EXPERIENCE ------------------ <3 -> +7, 3-10 -> +22, >10 -> +26
            if (experience < 3) result += 7;
                else if (experience < 10) result += 22;
                    else result += 26;
            System.out.println("stage: Experience. Result = " + result);

            // COSTS ------------------ <10k -> +33, 10-20 -> +21, 20-40 -> +10, >40 -> +1
            if (costs < 10000) result += 33;
                else if (costs < 20000) result += 21;
                    else if (costs < 40000) result += 10;
                        else result += 1;
            System.out.println("stage: Costs. Result = " + result);

            // CREDIT_TERM ------------------ <3 -> +33, 3-5 -> +22, >5 -> +11
            if (creditTerm < 3) result += 33;
                else if (creditTerm < 5) result += 22;
                    else result += 11;
            System.out.println("stage: CreditTerm. Result = " + result);

            // IMMOVABLES ------------------ 0 -> +1, 1 -> +33
            if (immovables) result += 33;
                else result += 1;
            System.out.println("stage: Immovables. Result = " + result);

            // IMMOVABLES_TYPE ------------------ country=0 -> +10, garage=1, -> +8, apartament=2 -> +15, other=3 -> +3
            switch (immovablesType) {
                case 0: result += 10;
                case 1: result += 8;
                case 2: result += 15;
                case 3: result += 3;
            }
            System.out.println("stage: ImmovablesType. Result = " + result);

            // CAR ------------------ 0 -> +1, 1-> +22
            if (car) result += 22;
                else result += 1;
            System.out.println("stage: Car. Result = " + result);

            //carMark                           ?

            // AUTO_YEAR ------------------ <5 -> +20, 5-10 -> +14, >10 -> +7
            Integer diffAutoYear = currentYear - autoYear;

            if (diffAutoYear < 5) result += 20;
                else if (diffAutoYear < 10) result += 14;
                    else result += 7;
            System.out.println("stage: AutoYear. Result = " + result);

            // ADDITIONAL_INCOME ------------------ 0 -> +1, 1 -> +10
            if (additionalIncome) result += 1;
                else result += 10;
            System.out.println("stage: AdditionalIncome. Result = " + result);

            // ADDITIONAL_INCOME_TYPE ------------------ alimony=0 -> +10, insurance=1 -> +8, houseWork=2 -> +6,
            // benefit=3 -> +10, lease=4 -> +21, other=5 -> +3
            switch (additionalIncomeType) {
                case 0: result += 10;
                case 1: result += 8;
                case 2: result += 6;
                case 3: result += 10;
                case 4: result += 21;
                case 5: result += 3;
            }
            System.out.println("stage: AdditionalIncomeType. Result = " + result);

            // ADDITIONAL_INCOME_SUMM ------------------ <5k -> +6, 5-15k -> +18, 15-30k -> +31, 30-50k -> +45,
            // >50k -> +67
            if (additionalIncomeSumm < 5000) result += 6;
                else if (additionalIncomeSumm < 15000) result += 18;
                    else if (additionalIncomeSumm < 30000) result += 31;
                        else if (additionalIncomeSumm < 50000) result += 45;
                            else result += 67;
            System.out.println("stage: AdditionalIncomeSumm. Result = " + result);

            // EFFECTIVE_CREDIT ------------------ 0 -> +30, 1 -> +1
            if (effectiveCredit) result += 1;
                else result += 30;
            System.out.println("stage: EffectiveCredit. Result = " + result);


            // EFFECTIVE_CREDIT_SUMM ------------------ <10k -> +33, 10-20k -> +11, 20-40k -> +6, >40k -> +1
            if (effectiveCreditSumm < 10000) result += 33;
                else if (effectiveCreditSumm < 20000) result += 11;
                    else if (effectiveCreditSumm < 40000) result += 6;
                        else result += 1;
            System.out.println("stage: EffectiveCreditSumm. Result = " + result);

        } // TRY ---------------- END

        catch(Exception e)
        {
            return e.toString();

        } // CATCH ---------------- END

        return currentDay.toString() + "." + currentMonth.toString() + "." + currentYear.toString() +
                ":Vash resultat:" + result.toString();

    } // CALCULATE ---------------- END
} // CLASS ---------------- END
