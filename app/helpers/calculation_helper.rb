module CalculationHelper
def(age, weight, height, sex, activityFactor)


//All vitamins and minerals are daily recommended equally for everyone (obviously ignoring small children who this program is not aimed at)


VAScore=0
if(VitA<900)
		VAScore = (900-VitA)/180
		end
		if(VitA>3000)
				VAScore = (VitA-900)/180
				end

				VB6Score=0
				if(VitB6<1.3)
						VB6Score = (1.3-VitB6)/.26
						end
						if(VitB6>100)
								VB6Score = (VitB6-100)/.26
								end

								VB12Score=0
								if(VitB12<2.4)
										VB12Score = (2.4-VitB12)/.48
										end

										VCScore =0
										if(VitC<90)
												VCScore = (90-VitC)/18
												end
												if(VitC>2000)
														VCScore = (VitC-2000)/18
														end

	  VDScore = 0
		if(VitD<1.5)
			VDScore = (1.5-VitD)/.3
		end
		if(VitD>100)
			VDScore = (VitD-100)/.3
		end

		CalcScore = 0
		if(Calc<1000)
			CalcScore = (1000-Calc)/200
		end
		if(Calc>2500)
			CalcScore = (Calc-2500)/200
		end

		PotasScore = 0
		if(Potas<4.7)
			PotasScore = (4.7-Potas)/9.4
		end

		SodScore = 0
		if(Sod<1.5)
			SodScore = (1.5-Sod)/.3
		end
		if(Sod>2.3)
		SodScore = (Sod-2.3)/.3
		end
		FiberScore = 0
		if(Fiber<25)
			FiberScore=(25-Fiber)/5
		end


		CarbScore = 0
		if(Carb<200)
			CarbScore = (200-CarbScore)/40
		end
		if(Carb>550)
			CarbScore = (CarbScore-550)/20
		end

		BMR = 0
		if (Sex = 0)
			BMR = (66+(6.23*weight)+(12.7*height)-(6.8*age)
		else
			BMR = (655+(4.35*weight)+(4.7*height)-(4.7*age)
		end
		ExpCal =0;
		if(ActFact==1)
			ExpCal=BMR*1.2
		end
		if(ActFact==2)
			ExpCal=BMR*1.375
		end
		if(ActFact==3)
			ExpCal=BMR*1.55
		end
		if(ActFact==4)
			ExpCal=BMR*1.725
		end
		if(ActFact==5)
			ExpCal=BMR*1.9
		end

		CalScore=0
		if(Cal<ExpCal-350)
			CalScore=(ExpCal-350-Cal)/100
		end
		if(Cal>ExpCal+150)
			CalScore=(Cal-ExpCal-150)/100
		end

																																																				TFScore = 0;
		if(TFats>ExpCal/1000)
			TFScore = (TFats-ExpCal/1000)/2
		end

		SFScore = 0
		if(SFats> ExpCal/90)
			SFScore = (SFats-ExpCal/90)/20
		end
		FatScore=0
		if(Fats>height-(10*sex)-((age-20)/10)+((ActFact-1)*4))
			FatScore = (Fats- height-(10*sex)-((age-20)/10)+((ActFact-1)*4))/4
		end
		ExpProt = 0
		if(ActFact=1)
			ExpProt=weight/2.2*.8
		end
		if(ActFact=2)
			ExpProt=weight/2.2*1
		end
		if(ActFact=3)
			ExpProt=weight/2.2*1.3
		end
		if(ActFact=4)
			ExpProt=weight/2.2*1.2
		end
		if(ActFact=5)
			ExpProt=weight/2.2*1.6
		end
		ProtScore=0
		if(Prot<ExpProt-15)
			ProtScore =(ExpProt-15-Prot)/5
		end
		if(Prot>ExpProt+15)
			ProtScore = (Prot-ExpProt-15)/5
		end
		CholScore=0
		if(Chol>300)
			CholScore = (Chol-300)/15
		end

		TotalScore = 100 – ProtScore – FatScore – SFScore – TFScore – CalScore – CarbScore – FiberScore – SodScore – PotasScore – CalcScore – VDScore – VCScore – VB12Score – VB6Score – VAScore - CholScore;




end
end
