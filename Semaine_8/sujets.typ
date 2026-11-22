#set page(paper: "a4", margin: (x: 1.8cm, y: 1.5cm))
#set text(size: 10pt, font: "New Computer Modern", lang: "fr")
#set page(footer: align(center)[#text(size: 8pt)[Colleur : SPAETH‐‐LEMARCHAND Alexis]])
#set enum(indent: 0.5em, body-indent: 0.5em)
#set list(indent: 0.5em, body-indent: 0.5em)

#let entete(lettre) = {
  align(center)[
    #text(size: 12pt, weight: "bold")[Colles physique PSI semaine 8 : 16/11/2026]
    #linebreak()
    #text(size: 11pt, weight: "bold")[Sujet #lettre]
  ]
  v(6pt)
  line(length: 100%, stroke: 0.5pt)
  v(6pt)
}

#let qdc(corps) = {
  block(width: 100%, inset: 8pt, stroke: 0.5pt, radius: 2pt)[
    #text(weight: "bold", size: 10pt)[Question de cours]
    #v(4pt)
    #corps
  ]
  v(10pt)
}

#let titre_exo(nom, source: none) = {
  v(4pt)
  text(weight: "bold", size: 11pt)[#nom]
  if source != none {
    text(size: 10pt, style: "italic")[ (#source)]
  }
  v(4pt)
}

#let nan = text(style: "italic")[(application numérique non demandée)]

// ==================== SUJET A ====================
#entete("A")

#qdc[
  + Retrouver par un raisonnement en temps caractéristique l'expression du nombre de Reynolds.
  + Donner la valeur approximative du nombre de Reynolds pour une situation classique (donnée par le colleur). En déduire le régime d'écoulement.
]

#titre_exo("Résistance hydraulique de l'arbre bronchique", source: "d'après CCP")

Lors de l'inspiration, l'air passe par la trachée puis par un réseau de conduits de plus en plus fins, l'arbre bronchique, avant d'atteindre les alvéoles. On modélise ce réseau par un arbre à divisions dichotomiques : chaque conduit se divise en deux conduits identiques, qui se divisent à leur tour en deux, etc. On appelle *génération* chaque niveau de division, numéroté par l'entier $p$ : la trachée est la génération $p = 1$, les deux bronches principales la génération $p = 2$, etc. Un conduit de génération $p$ est assimilé à un cylindre de rayon $r_p$ et de longueur $l_p$ ; à chaque génération, rayon et longueur sont multipliés par un même facteur $h < 1$ : $r_(p+1) = h thin r_p$ et $l_(p+1) = h thin l_p$.

#grid(columns: (1fr, 0.82fr), column-gutter: 8pt, align: horizon,
[On se place en régime stationnaire ; l'air est un fluide newtonien incompressible de masse volumique $mu$ et de viscosité $eta$. On note $Q_1$ le débit volumique entrant dans la trachée. On admet que, pour un écoulement de Poiseuille dans un conduit cylindrique de rayon $r$ et de longueur $l$, la chute de pression $Delta P$ et le débit volumique $Q$ sont reliés par $Delta P = R_h Q$ avec $R_h = 8 eta l \/ (pi r^4)$.

_Données :_ trachée : $r_1 = "0,9"$ cm, $l_1 = 12$ cm ; $h approx "0,85"$ ; air : $eta = "1,8" dot 10^(-5)$ Pa$dot$s, $mu = "1,2"$ kg$dot$m$""^(-3)$. Au repos, on inspire environ $"0,5"$ L d'air en $2$ s.],
[#image("Images/arbre_bronchique.png", width: 100%)])

+ Justifier le nom de « résistance hydraulique » donné à $R_h$ par analogie avec l'électrocinétique (grandeurs analogues à la tension et à l'intensité). Exprimer la résistance $R_1$ de la trachée et la chute de pression $Delta P_1$ à ses bornes #nan. Évaluer le débit $Q_1$ au repos.
+ Déterminer le nombre $N(p)$ de conduits de la génération $p$. Exprimer $r_p$ et $l_p$ en fonction de $p$, $h$, $r_1$ et $l_1$.
+ Exprimer la résistance $R_p$ d'un conduit de génération $p$ en fonction de $R_1$, $h$ et $p$. Quel est le débit dans un conduit de génération $p$ ? En déduire la résistance équivalente $R_(t,p)$ de l'ensemble de la génération $p$. On posera $X = 2 h^3$.
+ Justifier que les générations successives sont associées en série. En déduire la résistance totale $R_t$ d'un arbre à $n$ générations, en fonction de $R_1$, $X$ et $n$.
+ Exprimer le volume total $V_(t,p)$ de la génération $p$, puis le volume $V_t$ de l'arbre à $n$ générations, en fonction du volume $V_1$ de la trachée, de $X$ et de $n$.
+ On fait tendre $n$ vers l'infini. Montrer qu'il existe une valeur critique $h_c$ telle que le volume de l'arbre diverge si $h > h_c$ et que sa résistance diverge si $h < h_c$. Calculer $h_c$ (on donne $2^(1\/3) approx "1,26"$). Quel compromis la valeur $h_c$ réalise-t-elle ? Commenter la valeur réelle $h approx "0,85"$.
+ Exprimer la puissance $cal(P)_m$ que doivent fournir les muscles respiratoires pour maintenir l'écoulement, en fonction de $R_t$ et $Q_1$ #nan.
+ On note $"Re"_p$ le nombre de Reynolds dans un conduit de génération $p$. Exprimer $"Re"_p$ en fonction de $"Re"_1$, $h$ et $p$. Estimer $"Re"_1$. Comment évolue $"Re"_p$ le long de l'arbre ? En réalité, on considère que le modèle de Poiseuille n'est valable qu'entre les générations $p = 6$ et $p = 16$ : proposer des explications.
+ Au-delà de $p approx 17$, les conduits participent aux échanges gazeux. Estimer le diamètre des conduits de la génération 17 (on donne $"0,85"^16 approx "0,074"$). Commenter.

#pagebreak()

// ==================== SUJET B ====================
#entete("B")

#qdc[
  Établir la résistance électrique d'un conducteur ohmique cylindrique parcouru uniformément par un courant parallèle à son axe.
]

#titre_exo("Fuite d'un réservoir", source: "oral CCP")

#emph[L'objectif des résolutions de problème consiste à modéliser une situation, en proposant des hypothèses, afin de répondre à la question posée. Le choix argumenté des hypothèses pour la mise en place du modèle est une partie essentielle de l'exercice.]

Dans les Alpes-Maritimes, au milieu d'une forêt, les pompiers ont accès à un réservoir d'eau en béton de $60 thin 000$ litres. Ce réservoir est un parallélépipède posé sur le sol, de dimensions intérieures : largeur $4$ m, longueur $5$ m et hauteur $3$ m ; l'épaisseur des parois en béton est de $20$ cm. Le réservoir est fermé ; les pompiers prélèvent l'eau grâce à un tuyau qui sort à l'air libre au-dessus du réservoir.

Lors d'une vérification de la citerne, les pompiers constatent une fissure, que l'on considérera rectangulaire, de $10$ cm de long, située à $50$ cm du fond du réservoir. Le réservoir était plein ; on observe que la hauteur d'eau à l'intérieur a diminué de $20$ cm en deux mois.

+ En supposant la loi de Poiseuille en régime laminaire valable, le débit volumique à travers la fissure s'écrit
  $ Q_v = frac(w^3 L thin Delta P, 12 eta thin e) $
  avec $L$ la longueur de la fissure, $e$ l'épaisseur de la paroi, $w$ la largeur de la fissure et $Delta P$ la différence de pression entre ses deux extrémités. Déterminer l'expression de la largeur $w$ de la fissure #nan.
+ Ne pouvant envisager de réparer, les pompiers décident d'obturer de façon étanche l'ouverture par laquelle sort le tuyau, pour arrêter la fuite. Expliquer pourquoi l'écoulement finit par s'arrêter. Au bout de combien de temps l'eau s'arrête-t-elle de s'écouler ? Quel est le volume d'eau perdu ? #nan

_Données :_ $eta_"eau" = 10^(-3)$ Pa$dot$s ; $mu_"eau" = 10^3$ kg$dot$m$""^(-3)$ ; $P_0 = 1$ bar ; $g = "9,8"$ m$dot$s$""^(-2)$.

#pagebreak()

// ==================== SUJET C ====================
#entete("C")

#qdc[
  Établir la loi de Hagen-Poiseuille pour un écoulement à bas nombre de Reynolds dans une conduite horizontale, calculer la résistance hydraulique.
]

#titre_exo("Vol plané")

On considère un avion de masse $m = 800$ kg et de surface alaire $S = 15$ m$""^2$ (surface utilisée pour le calcul de la traînée et de la portance), volant moteur coupé (vol plané) dans l'air de masse volumique $mu = "1,2"$ kg$dot$m$""^(-3)$, au repos par rapport au référentiel terrestre supposé galiléen. On prendra $g = "9,8"$ m$dot$s$""^(-2)$.

L'aile subit une force de traînée, colinéaire et opposée à la vitesse de l'avion par rapport à l'air, d'intensité $F_x = 1/2 mu S V^2 C_x$, et une force de portance, perpendiculaire à cette vitesse, d'intensité $F_y = 1/2 mu S V^2 C_y$. Les coefficients de traînée $C_x$ et de portance $C_y$ dépendent de l'angle d'incidence $alpha$ (angle entre la corde de l'aile et la vitesse de l'avion par rapport à l'air) selon les courbes ci-dessous.

#align(center)[#image("Images/polaire_avion.png", width: 88%)]

Le pilote ajuste l'angle d'incidence à une valeur $alpha$ constante, tout en s'assurant que l'angle $theta$ entre la trajectoire (le vecteur vitesse) et l'horizontale et la norme $V$ de la vitesse restent constants lors de la descente.

+ Représenter sur un schéma le vecteur vitesse de l'avion et les forces qu'il subit, en précisant les angles $alpha$ et $theta$.
+ Déduire du principe fondamental de la dynamique une relation entre $C_x (alpha)$, $C_y (alpha)$ et $theta$.
+ Pour une même perte d'altitude, comment obtenir une distance horizontale de vol plané maximale ? Estimer l'incidence correspondante à l'aide des courbes.
+ Pour $alpha = 5 degree$, lire $C_x$ et $C_y$ sur les courbes. En déduire l'angle $theta$ et la distance horizontale parcourue pour une descente de $500$ m. Exprimer la vitesse $V$ de l'avion lors de la descente #nan.

#pagebreak()

// ==================== SUJET D ====================
#entete("D")

#qdc[
  Établir l'expression du champ de pression de l'atmosphère isotherme dans le modèle du gaz parfait.
]

#titre_exo("Le cœur, une pompe à incendie ? (modèle « Windkessel »)")

Le cœur éjecte le sang de façon intermittente : pendant la systole (durée $t_s approx "0,30"$ s par battement), puis plus rien pendant la diastole. Pourtant, la pression artérielle reste comprise entre $80$ et $120$ mmHg environ, et le sang s'écoule de façon presque continue dans les capillaires. Pour l'expliquer, on s'inspire d'un dispositif des pompes à incendie du XVIII#super[e] siècle.

_Données :_ $1$ mmHg $= 133$ Pa ; $P_0 = 1$ bar ; fréquence cardiaque $f = 70$ battements par minute ; volume de sang éjecté par battement $V_E = 70$ mL.

*Partie 1 : la chambre à air (« Windkessel ») des pompes à incendie.* Une pompe à piston refoule l'eau de façon intermittente, avec un débit $Q_e (t)$, dans un réservoir fermé, dans le haut duquel est emprisonné un volume $V_a$ d'air (gaz parfait, température constante). L'eau ressort par une lance, de résistance hydraulique $R$, et débouche à la pression $P_0$. On note $P$ la pression dans le réservoir, supposée uniforme.

+ Montrer que, pour de petites variations de pression, le volume $V$ d'eau dans le réservoir vérifie $dif V = C dif P$ ; exprimer $C$ en fonction de $V_a$ et $P$.
+ Par un bilan de volume sur l'eau du réservoir, montrer que $display(C frac(dif P, dif t) + frac(P - P_0, R) = Q_e (t))$.
+ Proposer un circuit électrique équivalent : préciser ce qui joue le rôle de la tension, de l'intensité et de la charge, et identifier le composant qui modélise la chambre à air.

*Partie 2 : application à la circulation artérielle.* On modélise l'aorte et les grosses artères, élastiques, par une *compliance* $C = dif V \/ dif P$, et l'ensemble des artérioles et capillaires par une résistance hydraulique $R$ ; le sang en sort à une pression veineuse prise comme référence nulle. $Q_e (t)$ est le débit éjecté par le ventricule gauche, de période $T = 1 \/ f$.

#set enum(start: 4)
+ Établir l'équation vérifiée par $P(t)$. Exprimer le débit moyen $overline(Q)$ ; en moyennant l'équation sur une période en régime périodique, montrer que la pression moyenne vérifie $overline(P) = R overline(Q)$.
+ La résistance périphérique est dominée par les plus petits vaisseaux, pourtant extrêmement nombreux et montés en parallèle. Justifier qualitativement.
+ Pendant la diastole, la valve aortique est fermée. Établir l'expression de $P(t)$. On relève $117$ mmHg au début de la diastole et $80$ mmHg à sa fin : indiquer comment en déduire la constante de temps du modèle, puis $C$ connaissant $R$ #nan.
+ On décompose $Q_e (t)$ en sa valeur moyenne et une somme d'harmoniques. Pour une harmonique de pulsation $omega$, exprimer la fonction de transfert $underline(H) = underline(P) \/ underline(Q)_e$. De quel type de filtre s'agit-il ? Pour une constante de temps de l'ordre de $"1,5"$ s, comparer la fréquence de coupure à $f$ et conclure sur le rôle de l'aorte.
+ On modélise $Q_e (t)$ par un créneau périodique : débit $Q_0$ constant pendant $t_s$, nul pendant la diastole $t_d = T - t_s$. En régime périodique établi, déterminer les pressions maximale $P_max$ et minimale $P_min$ #nan.
+ Avec l'âge, les artères se rigidifient. Prévoir l'évolution de $P_max$, $P_min$ et $overline(P)$ quand $C$ diminue, en s'appuyant sur les cas limites $R C >> T$ et $R C << T$.
+ Citer des limites de ce modèle.
