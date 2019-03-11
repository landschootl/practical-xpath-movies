(:::::::::::::::::: EXERCICE 1 ::::::::::::::::::)
(::: Pour executer une database (fichier xml) sur BaseX faire Database->new->selectionner le fichier :::)
(: QUESTION 1 :)
(: 1 :)
//title

(: 2 :)
//title/text()

(: 3 :)
//movie[year>2000]/title/text()

(: 4 :)
//title[contains(text(),"V")]

(: 5 :)
//movie[count(actor)=3]

(: 6 :)
//artist[@id=//movie[title="Heat"]/director/@id]

(: 7 :)
//movie[actor/@id=//artist[last_name/text()="Dunst" and first_name/text()="Kirsten"]/@id]/title/text()

(: 8 :)
//movie[summary]

(: 9 :)
//movie[not(summary)]

(: 10 :)
//movie[title="Unforgiven"]/actor[@id=//artist[last_name/text()="Eastwood" and first_name/text()="Clint"]/@id]/@role

(: 11 :)
//movie[last()]

(: 12 :)
//movie[title="Marie Antoinette"]/preceding-sibling::movie[1]/title/text()



(: QUESTION 2 :)
(: 1 :)
//artist/(if (./birth_date < 1940) then ./last_name else ./first_name)
//artist/(if (birth_date < 1940) then last_name else first_name)

(: 2 :)
//artist/(if (./birth_date < 1940) then ./last_name else ())



(: QUESTION 3 :)
(: 1 :)
for $i in //director/@id return //artist[@id = $i]/(first_name/text(), last_name/text())



(: QUESTION 4 :)
(: 1 :)
some $m in //movie satisfies $m[count(actor)>2]

(: 2 :)
every $a in //artist, $m in //movie satisfies $m[(actor|director)/@id=$a/@id]

(: 3 :)
every $a in //artist satisfies //movie[(actor|director)/@id=$a/@id]




(:::::::::::::::::: EXERCICE 2 ::::::::::::::::::)
(: QUESTION 1 : à executer sur SQLDeveloper :)
SELECT xmlelement(name "genealogies",
  xmlagg(
    xmlelement(name "personne",
      xmlattributes(id_pers as "id", sexe),
      xmlforest(nom, prenom, naissance, deces, id_pere as "pere", id_mere as "mere")
    )
  )
)
FROM Personne;

(: QUESTION 2 :)
(: 1 :)
//personne[@id=6]/naissance/text()

(: 2 :)
//personne[nom="LUCAS" and prenom="Marie"]/naissance/text()

(: 3 :)
//personne[@id = //personne[nom="OMNES" and prenom="Guillaume" and naissance=1815]/(mere,pere)]

(: 4 :)
count(//personne[(mere/text()|pere/text())=//personne[@id=//personne[@id=7]/(pere|mere)]/@id/string() and @id != '7'])

(: QUESTION 3 :)

(: 1 :)
//personne[.//enfants/personne[nom='OMNES' and prenom='Yves']]/(nom,prenom)

(: 2 :)
count(//personne[@id='71']/(following-sibling::*,preceding-sibling::*))

(: 3 -> Le nombre de femmes qui ont des enfants :)
