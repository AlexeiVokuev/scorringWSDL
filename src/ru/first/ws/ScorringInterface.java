package ru.first.ws;

import javax.jws.WebMethod;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.jws.WebParam;


@WebService

@SOAPBinding(style = SOAPBinding.Style.DOCUMENT)


public interface ScorringInterface{
    @WebMethod
    public String searchExistScore( //поиск уже заполненной анкеты в базе
            @WebParam(
                    name = "firstName"
            )
            String firstName,
            @WebParam(
                    name = "lastName"
            )
            String lastName,
            @WebParam(
                    name = "phoneNumber"
            )
            String phoneNumber
    );

    public String calculate( //получение результата по новой анкете
            @WebParam(
                    name = "firstName"
            )
            String firstName,
            @WebParam(
                    name = "lastName"
            )
            String lastName,
            @WebParam(
                    name = "phoneNumber"
            )
            String phoneNumber,
            @WebParam(
                    name = "sex"
            )
            Integer sex,
            @WebParam(
                    name = "birthday"
            )
            String birthday,
            @WebParam(
                    name = "monthlyIncome"
            )
            Long monthlyIncome,
            @WebParam(
                    name = "passportSeries"
            )
            Integer passportSeries,
            @WebParam(
                    name = "passportNumber"
            )
            Long passportNumber,
            @WebParam(
                    name = "address"
            )
            String address,
            @WebParam(
                    name = "houseType"
            )
            Integer houseType,
            @WebParam(
                    name = "familyStatus"
            )
            Integer familyStatus,
            @WebParam(
                    name = "childrenAmount"
            )
            Integer childrenAmount,
            @WebParam(
                    name = "education"
            )
            Integer education,
            @WebParam(
                    name = "socialStatus"
            )
            Integer socialStatus,
            @WebParam(
                    name = "activity"
            )
            Integer activity,
            @WebParam(
                    name = "workPost"
            )
            Integer workPost,
            @WebParam(
                    name = "experience"
            )
            Integer experience,
            @WebParam(
                    name = "costs"
            )
            Long costs,
            @WebParam(
                    name = "creditTerm"
            )
            Integer creditTerm,
            @WebParam(
                    name = "immovables"
            )
            Integer immovables,
            @WebParam(
                    name = "immovablesType"
            )
            Integer immovablesType,
            @WebParam(
                    name = "car"
            )
            Integer car,
            @WebParam(
                    name = "carMark"
            )
            String carMark,
            @WebParam(
                    name = "carYear"
            )
            Integer autoYear,
            @WebParam(
                    name = "additionalIncome"
            )
            Integer additionalIncome,
            @WebParam(
                    name = "additionalIncomeType"
            )
            Integer additionalIncomeType,
            @WebParam(
                    name = "additionalIncomeSumm"
            )
            Long additionalIncomeSumm,
            @WebParam(
                    name = "effectiveCredit"
            )
            Integer effectiveCredit,
            @WebParam(
                    name = "effectiveCreditSumm"
            )
            Long effectiveCreditSumm
    );
}
