select
distinct count(parliament_constituency) as total_seats
from constituencywise_results;

select 
s.state as state_name,
count(cr.parliament_constituency) as total_seats
from
constituencywise_results cr
inner join statewise_results sr 
on cr.parliament_constituency = sr.parliament_constituency
inner join states s on sr.state_id = s.state_id
group by s.state;


--Total Seats won by NDA Alliance
SELECT 
    SUM(CASE 
            WHEN party IN (
                'Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
                'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM'
            ) THEN [Won]
            ELSE 0 
        END) AS NDA_Total_Seats_Won
FROM 
    partywise_results


----Seats won by NDA Alliance parties

select 
party as Party_Name,
won as Seats_won 
from partywise_results
where
	party in (
				'Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
                'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM'
				)
order by Seats_won DESC;

  
--Total seats won by I.N.D.I.A Alliance

select
	sum(case
		when party in (
						'Indian National Congress - INC',
						'Aam Aadmi Party - AAAP',
						'All India Trinamool Congress - AITC',
						'Bharat Adivasi Party - BHRTADVSIP',
						'Communist Party of India  (Marxist) - CPI(M)',
						'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
						'Communist Party of India - CPI',
						'Dravida Munnetra Kazhagam - DMK',
						'Indian Union Muslim League - IUML',
						'Nat`Jammu & Kashmir National Conference - JKN',
						'Jharkhand Mukti Morcha - JMM',
						'Jammu & Kashmir National Conference - JKN',
						'Kerala Congress - KEC',
						'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
						'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
						'Rashtriya Janata Dal - RJD',
						'Rashtriya Loktantrik Party - RLTP',
						'Revolutionary Socialist Party - RSP',
						'Samajwadi Party - SP',
						'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
						'Viduthalai Chiruthaigal Katchi - VCK'
						) then [won]
						else 0
					 end) as INDIA_total_seats
from partywise_results

--Seats won by I.N.D.I.A Alliance parties

select 
party as party_name,
won as seats_won
from partywise_results
where party in ('Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
				)
order by seats_won DESC;

--Add new column field in table partywise_results to get the Party Allianz as NDA, I.N.D.I.A and OTHER

alter table partywise_results
add party_alliance varchar(50)
update partywise_results
set party_alliance= 'I.N.D.I.A'
where party in ('Indian National Congress - INC',
				'Aam Aadmi Party - AAAP',
				'All India Trinamool Congress - AITC',
				'Bharat Adivasi Party - BHRTADVSIP',
				'Communist Party of India  (Marxist) - CPI(M)',
				'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
				'Communist Party of India - CPI',
				'Dravida Munnetra Kazhagam - DMK',	
				'Indian Union Muslim League - IUML',
				'Jammu & Kashmir National Conference - JKN',
				'Jharkhand Mukti Morcha - JMM',
				'Kerala Congress - KEC',
				'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
				'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
				'Rashtriya Janata Dal - RJD',
				'Rashtriya Loktantrik Party - RLTP',
				'Revolutionary Socialist Party - RSP',
				'Samajwadi Party - SP',
				'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
				'Viduthalai Chiruthaigal Katchi - VCK'
				);
update partywise_results
set party_alliance = 'NDA'
where party in ('Bharatiya Janata Party - BJP',
				'Telugu Desam - TDP',
				'Janata Dal  (United) - JD(U)',
				'Shiv Sena - SHS',
				'AJSU Party - AJSUP',
				'Apna Dal (Soneylal) - ADAL',
				'Asom Gana Parishad - AGP',
				'Hindustani Awam Morcha (Secular) - HAMS',
				'Janasena Party - JnP',
				'Janata Dal  (Secular) - JD(S)',
				'Lok Janshakti Party(Ram Vilas) - LJPRV',
				'Nationalist Congress Party - NCP',
				'Rashtriya Lok Dal - RLD',
				'Sikkim Krantikari Morcha - SKM'
			   );
update partywise_results
set party_alliance = 'other'
where party_alliance is null;

select * from partywise_results

select party_alliance,
sum(won)
from partywise_results 
group by party_alliance

select party , won 
from partywise_results
where party_alliance = 'NDA'
order by won DESC;

--Winning candidate's name, their party name, total votes, 
--and the margin of victory for a specific state and constituency?

select 
cr.winning_candidate,
pr.party,
cr.total_votes,
cr.margin,
s.state,
cr.constituency_name
from constituencywise_results cr inner join partywise_results pr 
on cr.Party_ID = pr.Party_ID inner join statewise_results sr 
on cr.Parliament_Constituency = sr.Parliament_Constituency inner join states s
on sr.State_ID = s.State_ID
where Constituency_Name = 'GANDHINAGAR';

--What is the distribution of EVM votes versus postal votes 
--for candidates in a specific constituency?

select * from constituencywise_details

select 
cd.EVM_Votes,
cd.Postal_Votes,
cd.Total_Votes,
cd.Candidate,
cr.Constituency_Name
from constituencywise_results cr inner join constituencywise_details cd 
on cr.Constituency_ID = cd.Constituency_ID
where Constituency_Name = 'GANDHINAGAR'

--Which parties won the most seats in a State,
--and how many seats did each party win?

SELECT 
    p.Party,
    COUNT(cr.Constituency_ID) AS Seats_Won
FROM 
    constituencywise_results cr
JOIN 
    partywise_results p ON cr.Party_ID = p.Party_ID
JOIN 
    statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID
WHERE 
    s.state = 'Gujarat'
GROUP BY 
    p.Party
ORDER BY 
    Seats_Won DESC;


--What is the total number of seats won by each party alliance
--(NDA, I.N.D.I.A, and OTHER) in each state for the India Elections 2024

select 
s.State,
sum(case when pr.party_alliance = 'NDA' then 1 else 0 end) as NDA_won_seats,
sum(case when pr.party_alliance = 'I.N.D.I.A' then 1 else 0 end) as India_won_seats,
sum(case when pr.party_alliance = 'other' then 1 else 0 end) as other
from 
constituencywise_results cr inner join partywise_results pr
on cr.party_id = pr.party_id inner join statewise_results sr 
on cr.parliament_constituency = sr.Parliament_Constituency inner join states s
on sr.State_ID = s.State_ID 
where s.State = 'Maharashtra'
group by s.state