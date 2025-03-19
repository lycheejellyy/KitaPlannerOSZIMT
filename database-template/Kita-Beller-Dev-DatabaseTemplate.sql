-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 19, 2025 at 12:11 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `development`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `adding_children` (IN `_name` VARCHAR(255), IN `_gender` VARCHAR(255), IN `_birthdate` DATE, IN `_kita` VARCHAR(255), IN `_supervisor` VARCHAR(255), IN `_id` INT(11))   BEGIN
	START TRANSACTION;
    IF _id = 0 THEN
		INSERT INTO child(name, gender, birthdate, kita, supervisor)
		VALUES (_name, _gender, _birthdate, _kita, _supervisor);
    ELSE
    	UPDATE child
        SET name = _name,
        gender = _gender,
        birthdate = _birthdate,
        kita = _kita,
        supervisor = _supervisor
        WHERE id = _id;
    END IF;
    
    SELECT ROW_COUNT() AS 'rows';
    COMMIT;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `child`
--

CREATE TABLE `child` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `birthdate` date NOT NULL,
  `kita` varchar(255) NOT NULL,
  `supervisor` varchar(255) NOT NULL,
  `age_in_months` int(11) GENERATED ALWAYS AS (timestampdiff(MONTH,`birthdate`,curdate())) VIRTUAL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `child`
--

INSERT INTO `child` (`id`, `name`, `gender`, `birthdate`, `kita`, `supervisor`) VALUES
(2, 'Teresa Brauch', 'weiblich', '2022-10-19', 'Kita Regenbogen', 'Ramón Lucas'),
(3, 'Nam Gia Phung', 'männlich', '2022-10-19', 'Kita Regenbogen', 'Ramón Lucas'),
(4, 'Betty Lucas', 'weiblich', '2020-10-12', 'Kita Gewittersturm', 'Luca Marie Brauch'),
(5, 'Karlie Lagerfeld', 'weiblich', '2021-10-12', 'Kita Modenschau', 'Luca Marie Brauch'),
(6, 'Petra Berger', 'weiblich', '2023-03-09', 'Kita Kita', 'Peter Shaw'),
(7, 'Heidi Berger', 'weiblich', '2020-09-08', 'Kita Kita', 'Bob Andrews'),
(8, 'testchild', 'männlich', '2009-09-09', 'kita', 'tbd');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `sector_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `example` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `sector_id`, `description`, `example`) VALUES
(63, 13, 'Beruhigt sich nach dem Füttern.', 'Liegt da mit offenen Augen, lallt, schläft ein'),
(64, 13, 'Zeigt ruhige Aktitiväten, wenn es wach ist.', 'Hört Gesang und anderen Geräuschen zu, hält ein und schaut, beschäftigt sich kurze Zeit mit sich, betrachtet sein Hände.'),
(65, 13, 'Gurrt und macht andere Geräusche.', 'Macht Gurgel- und Grunzgeräusche, wimmert, äußert Vokallaute.'),
(66, 13, 'Hat regelmäßigen Schlaf und Wachrythmus.', 'Schläft morgens und nachmittags zu bestimmten Zeiten.'),
(67, 14, 'Wird auf dem Schoß sitzend gefüttert.', ''),
(68, 14, 'Wird mit dem Löffel gefüttert oder greift nach der Flasche.', ''),
(69, 14, 'Schläft nachts durch.', ''),
(70, 14, 'Zahnt.', 'Macht Mundbewegungen, sabbert, wimmert.'),
(71, 15, 'Füttert sich selbst kleine Happen Essen.', 'Kekse, Brothappen, Fruchtstücke'),
(72, 15, 'Trinkt mit Hilfe aus einer Tasse.', 'Schließt den Mund um die Tassenkante, beißt auf die Tassenkante, steckt die Zunge in die Tasse hinein.'),
(73, 15, 'Hält einen zweiten Löffel, wenn es gefüttert wird oder versucht nach dem Löffel zu greifen.', 'Schlägt mit dem Löffel auf den Tisch, steckt ihn in den Mund, spielt mit ihm.'),
(74, 15, 'Hält die Flasche', ''),
(75, 16, 'Schiebt sich mit dem Löffel Essen in den Mund und versucht den Löffel selbst zu füllen', ''),
(76, 16, 'Versucht allein aus der Tasse zu trinken.', 'Umfasst mit beiden Händen die Tasse und führt sie zum Mund; beim Trinken selbst noch sehr ungeschickt, es wird noch viel verschüttet.'),
(77, 16, 'Kooperiert beim An- und Ausziehen.', 'Versucht mitzuhelfen, z.B. hebt den Arm oder das Bein.'),
(78, 17, 'Zeigt Interesse an der Toilette.', 'Rollt Toilettenpapier ab, spielt mit Wasser, benutzt die Toilettenspülung, zieht an der Windel, wenn sie nass ist.'),
(79, 17, 'Isst ohne Hilfe mit dem Löffel.', 'Zeigt gute Koordination, wenn es selbst isst; isst selbst entweder unaufgrfordert oder wenn man ihm einen Löffel in die Hand gibt.'),
(80, 17, 'Trinkt allein aus der Tasse.', 'Umfasst die Tasse oder das Glas mit beiden Händen oder greift die Tasse am Henkel; trink, ohne viel zu verschütten.'),
(81, 17, 'Zieht einige Sachen selbst aus.', 'Mütze, Schal, Jacke.'),
(82, 18, 'Benutzt Seife, um die Hände zu waschen.', 'Nimmt die Seife in die Hand, macht sie nass und spült die Hände.'),
(83, 18, 'Zieht sich einige weitere Kleidungsstücke selbst aus.', 'Schuhe, Socken, Hose.'),
(84, 18, 'Hilft beim Saubermachen und Aufräumen.', 'Bringt die Puppe zu Bett oder das Auto in die Garage; wirft Abfälle in den Papierkorb, stellt Spielzeug ins Regal, wischt den Tisch ab.'),
(85, 18, 'Gibt vor auf die Toilette zu gehen.', 'Spielt mit Toilettenpapier, rollt Toilettenpapier direkt ins Becken oder in den Topf hinein, sitzt (manchmal) auf dem Topf und tut so, als ob es wirklich in den Topf.'),
(86, 18, 'Geht mit dem Taschentuch um.', 'Wischt das Gesicht mit dem Papiertaschentuch, zerknittert es und wirft es weg.'),
(87, 18, 'Zeigt Interesse am Zähneputzen.', 'Imitiert Putzbewegungen mit der Zahnbürste, schluckt Zahnpasta oder Wasser, das ihm zum Ausspülen angeboten wird.'),
(88, 19, 'Will Dinge allein tun.', 'Sich anziehen, Spielzeug holen, ausschneiden, kleben, Schuhe zuschnallen, Mantel aufhängen.'),
(89, 19, 'Bleibt tagsüber trocken.', 'Geht von selbst zur Toilette oder wenn es erinnert wird.'),
(90, 19, 'Wäscht Hände ohne Hilfe und trocknet sie ab.', 'Dreht den Wasserhahn an, unterscheidet zwischen heißem und kaltem Wasserhahn; nimmt das Handtuch, auch wenn es die Hände nicht vollständig abtrocknet.'),
(91, 19, 'Lerne seine Zähne zu bürsten.', 'Drückt Zahnpasta auf die Zahnbürste, bewegt die Zahnbürste im Mund.'),
(92, 19, 'Putzt seine Nase.', 'Schnaubt ganz leicht in das Taschentuch.'),
(93, 19, 'Versucht, allein Socken und Unterwäsche anzuziehen.', 'Zieht Socken an, ohne den richtigen Sitz der Ferse oder Zehen zu berücksichtigen; zieht die Hose an, richtig oder verkehrt herum.'),
(94, 19, 'Hilft freiwillig den Raum aufzuräumen und sauberzumachen.', 'Schließt sich spontan dem Erzieher an, wenn er anfängt, Spielzeuge und andere Gegendstände wegzuräumen.'),
(95, 19, 'Übernimmt die Verantwortung für kleinere Besorgungen und erledigt sie.', 'Verteilt Servietten, Teller und Bestecke vor gemeinsamen Mahlzeiten; sammelt Scheren und Papier ein, trägt schriftliche Mitteilungen von einem Zimmer in das andere.'),
(96, 20, 'Isst und trinkt selbstständig.', 'Hält den Löffel so, dass nicht alles herunterfällt; hält die Tasse, ohne alles zu verschütten.'),
(97, 20, 'Wäscht Gesicht und Hände ohne Hilfe.', 'Tut Seife auf den Waschlappen oder auf die Hände und wäscht sich das Gesicht mit dem einen oder anderen, ohne dass es dabei Hilfe benötigt.'),
(98, 20, 'Bürstet seine Zähne.', 'Drückt Pasta auf die Zahnbürste, steckt sie in den Mund, bewegt sie und spült den Mund mit Wasser aus.'),
(99, 20, 'Geht von selbst zur Toilette.', 'Muss nur selten erinnert werden, etwa wenn es in eine Tätigkeit versunken ist, versorgt sich dabei zum großen Teil selbst.'),
(100, 20, 'Kümmert sich darum, dass seine Sachen in Ordnung gehalten werden.', 'Räumt seine \"Kunstwerke\" sowie Pinsel, Farben, Buntstifte u.ä. aus eigener Initiative ins Fach.'),
(101, 21, 'Zeigt Geschicklichkeit bei der Benutzung von Essutensilien.', 'Hält den Löffel in richtiger \"Daumen-aufwärts\"-Haltung beim Essen.'),
(102, 21, 'Zeigt gute Koordination und ist (nahezu) unabhängig beim Ausziehen, zieht sich mit nur noch sehr wenig Hilfe aus.', 'Hose, Hemd, Pullover, Unterwäsche.'),
(103, 21, 'Zeigt feinmotorische Koordination beim Anziehen.', 'Zieht Schuhe und Socken an, ohne Schuhe zuzubinden, schließt Schuhschnallen; zieht Mantel an und macht große Knöpfe auf und zu.'),
(104, 21, 'Entwickelt Abneigung und Vorliebe für bestimmte Kleidungsstücke.', 'Besteht vielleicht auf Hosen mit Taschen oder auf Kleidungsstücken mit einer bestimmten Farbe.'),
(105, 21, 'Ist stolz darauf zu wissen, wo seine persönlichen Sachen aufbewahrt werden.', 'Kleidungsstücke, Spielzeug, Geschenke.'),
(106, 21, 'Toilettentraining: Blasentraining ist vollkommen abgeschlossen.', ''),
(107, 22, 'Versucht wie ein Erwachsener zu essen.', 'Zieht die Gabel dem Löffel vor bei angemessenen Speisen, versucht mit dem Messer zu schneiden und bemüht sich, nicht zu kleckern.'),
(108, 22, 'Versucht sich selbst ohne Hilfe anzuziehen.', 'Nimmt dabei noch keine Rücksicht auf Vorder- und Rückseite, rechts und links, innen und außen.'),
(109, 22, 'Versucht seine Schuhe zuzubinden.', 'Macht einfachen Knoten, versucht Schleifen nachzuahmen.'),
(110, 22, 'Geht selbstständig zur Toilette und erledigt alles ohne Hilfe.', ''),
(111, 22, 'Macht Konversation bei Mahlzeiten, ohne sich beim Essen stören zu lassen.', ''),
(112, 22, 'Hilft gern bei der Vorbereitung für das Essen.', ''),
(113, 23, 'Stellt sich beim Essen das eigene Menü zusammen.', 'Entscheidet, welchen Saft es vorzieht, ob es Butter oder Marmelade will.'),
(114, 23, 'Weiß Bescheid über den Gesundheitswert einiger Speisen.', 'Weiß, dass zuviel Süßigkeiten ungesund und schlecht für die Zähne sind; dass Vollkornbrot gesünder ist als Weißbrot, dass Obst und Gemüse gesund sind und Vitamine enthalten. Und kann einige gesunde und weniger gesunde Nahrungsmittel nennen.'),
(115, 23, 'Beschäftigt sich mit Doktor-Spielen.', ''),
(116, 23, 'Ist sich verschiedener Gefahren bewusst.', 'Zeigt Vorsicht oder Zurückhaltung bei gefährlichen Situationen; weiß was passiert, wenn es Gift verschluckt, giftige Beeren oder Pilze isst.'),
(117, 23, 'Führt Körperpflege vor dem Schlafen selbstständig und zuverlässig durch.', 'Putzt sich die Zähne und wäscht sich Gesicht und Hände sauber und trocknet sich ab.'),
(118, 23, 'Befasst sich mit der Frage nach dem Geschlecht.', 'Geht gern ins Badezimmer, wenn sich andere gerade dort aufhalten, um seine Neugier zu befriedigen.'),
(119, 24, 'Zieht sich alleine richtig und vollständig an.', 'Zieht sich komplett in einem Durchgang von der Unterwäsche bis zur Straßenkleidung (nach dem Turnen oder Schlafen) an. Achtet dabei auf \"vorne\" und \"hinten\", \"rechts\" und \"links\". Wenn es ein Kleidungsstück verdreht hat, korrigiert es sich unaufgefordert.'),
(120, 24, 'Putzt sich selbstständig die Nase, d.h. unaufgefordert und ohne Hilfe, noch bevor Sekret aus der Nase gelaufen ist.', ''),
(121, 24, 'Achtet auf seine Kleidung ohne Aufforderung.', 'Räumt sie regelmäßig an den für die vorgesehenen Platz, z.B. Korb oder Garderobe.'),
(122, 24, 'Ist beim Frühstück oder Abendbrot vollkommen selbstständig.', 'Schüttet sich Cornflakes auf den Teller, gießt Milch ein, bereitet sich selbstständig Kakao, schneidet Wurst oder Käse, schmiert sein Brot und schneidet es selbst durch.'),
(123, 24, 'Hält sich in verschiedenen Situationen selbstständig und unaufgefordert sauber.', 'Wäscht sich unaufgefordert und selbstständig die Hände nach dem Malen, Kleben, wischt sich unaufgefordert Mund und Gesicht ab, wenn verschmiert. Wäscht sich unaufgefordert die Hände vor dem Essen.'),
(124, 24, 'Tobt sich manchmal bis zur Erschöpfung aus.', 'Ziel der Tätigkeit des Kindes ist die körperliche Erschöpfung und nicht etwa die Freude an Kompoetenz in der Durchführung oder Üben von Tätigkeiten, z.B. Rennen ohne äußeres Ziel - das Ziel ist Erschöpfung.'),
(125, 25, 'Reagiert auf Veranderurgen und Unterschiede von Sinnesreizen.', 'Bsp: Temperaturveranderungen, Geschmacksunterschiede: süß, sauer, bitter, etc., sowie auf unterschiedliche Geräusche und Stimmen, unterbicht Saugen, wenn es eine unbekannte Stimme oder ein unbekanntes Geräusch hört.'),
(126, 25, 'Fixiert sich bewegende oder glänzende Gegenstände mit den Augen.', 'Blickt Objekte direkt an, folgt horizentalen oder vertikalen Bewegungen.'),
(127, 25, 'Schaut zwischen Gegenständen nur hin und her.', ''),
(128, 25, 'Steckt Hände und Dinge in den Mund.', 'Rassel, Bettzipfel.'),
(129, 26, 'Bemerkt Menschen und Gegenstände.', 'Unterbricht Spiel, um ein Spielzeug, das es nicht benutzt, oder Personen anzustarren, wendet sich dann wieder seiner Aktivität zu.'),
(130, 26, 'Greift nach oder berührt Gegenstände.', 'Möbel oder andere größere Gegenstände, greift hinein in Schachteln oder Schränke.'),
(131, 26, 'Folgt sich bewegenden Gegenständen.', 'Dreht den Kopf oder den ganzen Körper, um den Gegenstand im Blickfeld zu behalten.'),
(132, 26, 'Wendet sich zu der Quelle von Geräuschen.', 'Läutende Glocke, laute Stimme oder Musik.'),
(133, 26, 'Sieht regelmäßig wiederkehrende Ereignisse voraus.', 'Füttern, baden, einen Spaziergang, ins Laufgitter gesetzt werden; reagiert in Form von ungeduldiger Erwartung, mit Freude oder Abneigung.'),
(134, 27, 'Erkennt räumliche Entfernung und Beziehungen', 'Greift nach entfernt liegenden Gegenständen, sieht einen Gegenstand nach, wenn er verschwindet; macht deutlich, dass der Erwachsene im Weg steht, wenn dieser die Sicht zum Gegenstand teilweise versperrt, z.B. indem es sich zur Seite neigt oder durch Gesten anzeigt, dass der Erwachsene zur Seite treten soll.'),
(135, 27, 'Stellt Verbindungen zwischen Gegenständen her.', 'Zieht an Decke oder Tuch, um einen Gegenstand, den es haben möchte, damit heranzuholen.'),
(136, 27, 'Nimmt Gegendstände aus einem Behälter.', 'Kekse aus einer Schachtel, Bausteine aus der Kiste.'),
(137, 27, 'Reagiert überrascht oder erfreut auf Versteckspiele mit Personen oder Gegenständen.', 'Versteckspiel mit der Hand vor dem Gesicht; Spielzeug, das aus dem Blickfeld verschwindet und wieder auftaucht.'),
(138, 27, 'Imitiert Bewegungen von Gegenständen und Personen.', 'Schaukelnde Bewegungen, Schütteln des Kopfes, Händeklatschen, Mundbewegungen.'),
(139, 27, 'Zeigt häufiges Wiedererkennen von bekannten Personen oder Gegenständen.', 'Reagiert erregt oder bewegt sich auf bekannte Personen zu.'),
(140, 27, 'Sucht nach versteckten Gegenständen.', 'Nach einem Spielzeug, das aus seinem Blickfeld verschwindet.'),
(141, 28, 'Hebt Dinge vom Boden auf, um sie zu erkunden.', 'Schaut sie an, schüttelt sie, steckt sie im Mund, zeigt sie jemanden.'),
(142, 28, 'Reagiert auf die Frage \"wo ist?\" für einige Gegenstände und Personen.', '\"Wo ist der Hund?\", \"Wo ist die Puppe?\", indem es hinsieht, in die Richtung greift oder sich suchend umsieht.'),
(143, 28, 'Ist vorsichtig oder ängstlich mit unbekannten Erwachsenen.', 'Zögert, wird stutzig oder tut, als ob der Fremde nicht anwesend ist, verbirgt sich vielleicht sogar vor fremden Personen hinter vertrauten Personen.'),
(144, 28, 'Versucht Tiere oder bewegliche Gegenstände anzufassen.', 'Vögel, Katzen, Staubsauger, bewegliches Spielzeug.'),
(145, 29, 'Kundschaftet mit großem Interesse seine Umgebung aus.', 'Erforscht Löcher, Schachteln, Regale, versucht Schreibtisch oder Kommode zu öffnen; klettert, um begehrte Gegenstände zu bekommen; ist interessiert mit Sachen zu spielen, die Erwachsenen gehören.'),
(146, 29, 'Erkennt Gefahren.', 'Zeigt Furcht und/oder besondere Vorsicht vor Tieren, heißem Herd, dampfendem Essen (heiß), auf der Treppe zu fallen.'),
(147, 29, 'Unterscheidet nach der Verwendbarkeit von Dingen.', 'Wischt mit dem Lappen den Tisch ab; kehrt mit dem Besen, auch wenn es diese Gegenstände in seinem Spiel manchmal in anderer Weise gebraucht.'),
(148, 29, 'Ahmt Aktivitäten der Erwachsenen nach.', 'Telefonieren (hältden Telefonhörer ans Ohr, spricht hinein); kochen (rührt mit einem Löffel im Topf, gießt aus einem Topf aus).'),
(149, 30, 'Weiß wo im Raum Dinge aufbewahrt werden, ist interessiert sie wieder zurückzulegen.', 'Legt Bausteine ins Regal zurück, Malsachen in die Schublade; versucht Töpfe und Pfannen in den Schrank zurückzustellen, legt Abfall in den Mülleimer.'),
(150, 30, 'Beobachtet Erwachsene sehr genau bei der Arbeit.', 'Steht und sieht zu, wenn ein anderes Kind trockengelegt wird, beobachtet Handwerker, beobachtet Vorbereitungen von Materialien für verschiedenste Aktivitäten.'),
(151, 30, 'Imitiert Erwachsenenaktivitäten.', 'Gibt vor Tiere und Babys zu füttern, will Pflanzen Wasser geben.'),
(152, 30, 'Sammelt Gegenstände, die es auf Spaziergängen findet.', 'Steine, Blätter, Stöckchen, Papier.'),
(153, 30, 'Kennt Veränderungen im Wetter, z.B. Regen, Schnee, Wind.', 'Sieht erregt aus dem Fenster, wenn es draußen regnet oder schneit.'),
(154, 30, 'Unterscheidet nach Sammelbegriffen.', 'Sagt \"wau-wau\", wenn es ein Tier sieht oder \"Papa\", wenn es einen Mann sieht.'),
(155, 31, 'Erkennt und/oder benennt Dinge, die es nicht täglich sieht.', 'Bügeleisen, Tiere, Flugzeug.'),
(156, 31, 'Kennt die Bezeichnung für verschiedene Räume.', 'Reagiert richtig auf \"Hole deine Puppe, Topf, Kissen aus dem Bad, Schlafzimmer, Kinderzimmer, der Küche etc\".'),
(157, 31, 'Kennt und/oder bezeichnet verschiedene Orte richtig.', 'Postamt, Polizei, Bahnhof, Geschäfte, Zoo, Bank, Park, Schwimmbad, Spielplatz.'),
(158, 31, 'Kennt Vornamen von Erwachsenen.', 'Eltern, Großeltern, Onkel, Tante.'),
(159, 32, 'Nennt verschiedene Berufe.', 'Postbote, Polizist, Busfahrer, Lehrer usw.'),
(160, 32, 'Verhält sich situationsentsprechend.', 'Sitzt still während des Transports im Auto oder im Bus, bleibt bei Spaziergängen bei der Gruppe.'),
(161, 32, 'Sagt seinen Namen und weiß, wo es wohnt.', 'Sagt seinen vollen Namen und möglicherweise die Stadt; häufig sagt es auf die Frage, wo es lebt, \"in einem Haus\", \"in einer Wohnung\", \"in Deutschland\".'),
(162, 33, 'Kennt seine eigene Altersstufe und die anderer Personen.', 'Nennt sein eigenes Alter, wenn es gefragt wird. Drückt das Bedürfnis aus, älter zu sein, z.B. will das tun, was ältere Kinder tun.'),
(163, 33, 'Erkennt Gebiete, die es nicht täglich sieht.', 'Ruft den Namen von Straßen aus oder nennt Gebäude '),
(164, 33, 'Setzt Erfahrungen in Beziehung zueinander.', 'Ereinnert sich an Plätze, Leute, Ereignisse; sagt, wenn es einen Rasen nicht betreten darf: \"Aber bei dem anderen Spielplatz darf man auf den Rasen\".'),
(165, 33, 'Drückt Ängste verbal oder durch klare Gesten aus.', 'Zeigt Furcht vor Gefahren (realen oder imaginären), vor Dunkelheit, vor dem Arzt, vor gespieltem Angriff, vor Tieren.'),
(166, 33, 'Kennt die richtige Bezeichnung für Verwandte.', 'Richtige Verwandschaftsbezeichnung wie z.B. Bruder, Onkel, Tante, Oma.'),
(167, 34, 'Kennt Komplementäre Rollen wie Arzt-Patient, Käufer-Verkäufer, Polizist-Dieb.', 'Wenn es spielt, bittet es jemanden den Arzt zu spielen, so dass es selbst Patient sein kann; wenn ein Kind ruft: \"Ich spiel\' Räuber!\" antwortet es: \"Oh, dann bin ich der Polizist\".'),
(168, 34, 'Kennt Funktionen von Altersunterschieden.', 'Verbindet Altersunterschiede mit verschiedenen Tätigkeiten und Erfahrungen: \"Ich bin drei Jahre alt und brauche keine Windeln mehr\", \"Sie/er ist sechs Jahre alt und geht in die Schule\".'),
(169, 34, 'Erkennt bekannte Dinge und Orte an Hinweisen oder Zeichen.', 'Erkennt ein bekanntes Haus an der Eingangstür, die Tankstelle an der Zapfsäule, die U-Bahn an dem blauen Schild.'),
(170, 34, 'Erkennt Wege und Plätze (Orientierungssinn)', 'Sieht Zielorte voraus, selbst, wenn es selten da gewesen ist, sobald ein bekannter Weg eingeschlagen wird; drückt Unsicherheit aus, wenn ein unbekannter Weg eingeschlagen wird, um ein bekanntes Ziel zu erreichen; erkennt, wenn ein Umweg gemacht wird.'),
(171, 34, 'Unterscheidet und benennt kurz und lang, dick und dünn.', '\"Das ist eine dünne Knetschlange, die da ist dick.\", \"Diese Schlange ist ganz kurz, die andere ganz lang.\"'),
(172, 34, 'Erkennt auch Umgebungsgeräusche, die es nicht täglich hört.', 'Glockengeläut, Müllabfuhr, Autohupe, Rasenmäher.'),
(173, 35, 'Unterscheidet Tageszeiten und verbindet sie mit Tagesabläufen.', '\"Morgens frühstücken wir, abends gehe ich schlafen\".'),
(174, 35, 'Berichtet Reihenfolge täglicher Abläufe', '\"Nach dem Aufstehen ziehe ich mich an, frühstücke, putze Zähne und gehe dann in den Kindergarten.\"'),
(175, 35, 'Zeichnet vertraute Gegenstände seiner Umgebung.', 'Häuser, Autos, Tiere, Bäume.'),
(176, 35, 'Verbindet Jahreszeiten mit typischen Merkmalen.', '\"Im Sommer fahren wir in den Urlaub, im Herbst fallen die Blätter von den Bäumen, im Winter schneit es.\"'),
(177, 35, 'Kennt Namen und Funktionen der Angestellten des Kindergartens.', 'Anke ist die Vorschulerzieherin, Silvia ist in der roten Gruppe; Hans ist der Hausmeister, der repariert Dinge, Hanna ist die Leiterin und Sigrid, die macht sauber.'),
(178, 35, 'Unterscheidet und benennt rund und eckig.', 'Am Formenbrett unterscheidet es zwischen runden und eckigen Formen; benennt eckige und runde Gegenstände im Raum: \"Der Ball ist rund, die Kiste ist eckig\".'),
(179, 36, 'Setzt die Uhrzeit mit dem Tagesablauf in Verbindung.', '\"Um 12 essen wir, um 3 werde ich abgeholt, um 7 gehe ich schlafen\".'),
(180, 36, 'Zeichnet Dinge mit ihrem Inhalt.', 'Füllt ein Haus mit Mobiliar, ein Auto mit Fahrer, ein Flugzeug oder einen Zug mit Passagieren o.ä.'),
(181, 36, 'Reagiert auf Verkehrszeichen.', 'Reagiert auf die Ampel und bleibt bei \'rot\' ohne Aufforderung stehen, sagt z.B. \"Gleich kommt \'grün\' und dann können wir gehen!\"; erkennt z.B. Radwege, Zeichen für Spielstraße, Stoppschild, Parkplatz usw.'),
(182, 36, 'Verbindet gewisse Aufgaben mit Berufen.', 'Der Briefträger bringt die Post, der Feuerwehrmann löscht das Feuer, der Bäcker backt den Kuchen, der Arzt macht die Menschen gesund.'),
(183, 36, 'Nennt mindestens drei Teile seiner Adresse.', 'Land, Stadt, Bezirk, Straße, Hausnummer.'),
(184, 36, 'Unterscheidet Hell- und Dunke-Abstufungen von Farben. ', 'Hell- und Dunkelblau, -grün, -grau. \"Ich habe einen dunkelblauen Pulli, deiner ist hellblau.\"'),
(185, 37, 'Entdeckt und benennt feine Unterschiede bei ähnlichen Dingen.', 'Findet Unterschiede bei Suchbildern; wenn zwei Kinder fast dieselben Rücksäcke haben, vergleicht es genau und benennt den Unterschied.'),
(186, 37, 'Kennt seinen Geburtstag.', 'Nennt sein Alter und seinen Geburtstag mit Monat und Tag.'),
(187, 37, 'Benutzt Zeitbegriffe richtig.', '\"Vorgestern habe ich Oma besucht.\"; \"Übermorgen gehen wir ins Theater.\"; \"In zwei Monaten habe ich Geburtstag.\"'),
(188, 37, 'Benennt die Namen der Wochentage.', '\"Heute ist Dienstag, nach Sonntag kommt Montag\".'),
(189, 37, 'Zeigt großes Interesse am Kalender und an der Uhr.', 'Kennt die Funktion eines Kalenders, steht davor und will von der Erzieherin wissen, welcher Tag heute ist oder will seinen Geburstag auf dem Kalender gezeigt haben. Erkundigt sich nach der Uhrzeit, auch wenn diese nicht mit einem bestimmten Ereignis verknüpft ist.'),
(190, 37, 'Verfügt über eine gute räumliche Orientierung, die über den vertrauen Raum hinausreicht.', 'Wenn es gefragt wird, wo der Bäcker ist, versucht es zu beschreiben \"Gegenüber der Bushaltestelle\"; Geht auch weitere und kompliziertere Wege sicher, z.B. zum Supermarkt oder Schwimmbad, man braucht ihm nicht zu sagen wo es lang geht.'),
(191, 38, 'Üerquert Straßen sicher und selbstständig.', 'Kennt und beachtet die Funktion der Ampel, rennt nicht über die Straße und sieht erst nach links und rechts, bevor es die Straße überquest; achtet auf den Radweg.'),
(192, 38, 'Verbindet Jahreszeiten mit Eigenschaften und möglichen Tätigkeiten.', 'Auf die Frage \"Was ist im Winter?\" antwortet es z.B. \"Da ist es ganz kalt und man kann rodeln.\" Im Herbst fallen die Blätter vom Baum; im Sommer gibt es frisches Obst, ich kann zum Baden gehen, usw.'),
(193, 38, 'Beginnt die Uhrzeit zu lesen und erkennt schon 12 Uhr und 6 Uhr.', ''),
(194, 38, 'Seine Zeichnungen spiegeln seine Umwelt erkennbar wieder.', 'Gegenstände und Personen in richtiger Position und Proportion.'),
(195, 38, 'Benennt die Kalendermonate.', 'Kann sie bei Nachfrage nennen, wenn auch nicht in richtiger Reihenfolge. Nennt es: mehr als 5 Monate = tut es, 2-4 Monate = tut es teilweise, weniger als zwei = tut es nicht.'),
(196, 38, 'Nennt die Namen einiger Straßen in seiner Umgebung.', 'Straße, in der die Großeltern oder Freunde wohnen, Straße des Kindergartens.'),
(197, 39, '', ''),
(198, 39, '', ''),
(199, 39, '', ''),
(200, 39, '', ''),
(201, 39, '', ''),
(202, 39, '', ''),
(203, 40, '', ''),
(204, 40, '', ''),
(205, 40, '', ''),
(206, 40, '', ''),
(207, 40, '', ''),
(208, 40, '', ''),
(209, 41, '', ''),
(210, 41, '', ''),
(211, 41, '', ''),
(212, 41, '', ''),
(213, 41, '', ''),
(214, 41, '', ''),
(215, 42, '', ''),
(216, 42, '', ''),
(217, 42, '', ''),
(218, 42, '', ''),
(219, 42, '', ''),
(220, 42, '', ''),
(221, 43, '', ''),
(222, 43, '', ''),
(223, 43, '', ''),
(224, 43, '', ''),
(225, 43, '', ''),
(226, 43, '', ''),
(227, 44, '', ''),
(228, 44, '', ''),
(229, 44, '', ''),
(230, 44, '', ''),
(231, 44, '', ''),
(232, 44, '', ''),
(233, 45, '', ''),
(234, 45, '', ''),
(235, 45, '', ''),
(236, 45, '', ''),
(237, 45, '', ''),
(238, 45, '', ''),
(239, 46, '', ''),
(240, 46, '', ''),
(241, 46, '', ''),
(242, 46, '', ''),
(243, 46, '', ''),
(244, 46, '', ''),
(245, 47, '', ''),
(246, 47, '', ''),
(247, 47, '', ''),
(248, 47, '', ''),
(249, 47, '', ''),
(250, 47, '', ''),
(251, 48, '', ''),
(252, 48, '', ''),
(253, 48, '', ''),
(254, 48, '', ''),
(255, 48, '', ''),
(256, 48, '', ''),
(257, 49, '', ''),
(258, 49, '', ''),
(259, 49, '', ''),
(260, 49, '', ''),
(261, 49, '', ''),
(262, 49, '', ''),
(263, 50, '', ''),
(264, 50, '', ''),
(265, 50, '', ''),
(266, 50, '', ''),
(267, 50, '', ''),
(268, 50, '', ''),
(269, 51, '', ''),
(270, 51, '', ''),
(271, 51, '', ''),
(272, 51, '', ''),
(273, 51, '', ''),
(274, 51, '', ''),
(275, 52, '', ''),
(276, 52, '', ''),
(277, 52, '', ''),
(278, 52, '', ''),
(279, 52, '', ''),
(280, 52, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `phases`
--

CREATE TABLE `phases` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `age_months` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `phases`
--

INSERT INTO `phases` (`id`, `name`, `age_months`) VALUES
(15, 'phase1', 3),
(16, 'phase2', 6),
(17, 'phase3', 9),
(18, 'phase4', 12),
(19, 'phase5', 18),
(20, 'phase6', 24),
(21, 'phase7', 30),
(22, 'phase8', 36),
(23, 'phase9', 42),
(24, 'phase10', 48),
(25, 'phase11', 54),
(26, 'phase12', 60),
(27, 'phase13', 66),
(28, 'phase14', 72);

-- --------------------------------------------------------

--
-- Table structure for table `sectors`
--

CREATE TABLE `sectors` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phase_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sectors`
--

INSERT INTO `sectors` (`id`, `name`, `phase_id`) VALUES
(13, 'Körperpflege', 15),
(14, 'Körperpflege', 16),
(15, 'Körperpflege', 17),
(16, 'Körperpflege', 18),
(17, 'Körperpflege', 19),
(18, 'Körperpflege', 20),
(19, 'Körperpflege', 21),
(20, 'Körperpflege', 22),
(21, 'Körperpflege', 23),
(22, 'Körperpflege', 24),
(23, 'Körperpflege', 25),
(24, 'Körperpflege', 26),
(25, 'Umgebungsbewusstsein', 15),
(26, 'Umgebungsbewusstsein', 16),
(27, 'Umgebungsbewusstsein', 17),
(28, 'Umgebungsbewusstsein', 18),
(29, 'Umgebungsbewusstsein', 19),
(30, 'Umgebungsbewusstsein', 20),
(31, 'Umgebungsbewusstsein', 21),
(32, 'Umgebungsbewusstsein', 22),
(33, 'Umgebungsbewusstsein', 23),
(34, 'Umgebungsbewusstsein', 24),
(35, 'Umgebungsbewusstsein', 25),
(36, 'Umgebungsbewusstsein', 26),
(37, 'Umgebungsbewusstsein', 27),
(38, 'Umgebungsbewusstsein', 28),
(39, 'Emotionale Entwicklung', 15),
(40, 'Emotionale Entwicklung', 16),
(41, 'Emotionale Entwicklung', 17),
(42, 'Emotionale Entwicklung', 18),
(43, 'Emotionale Entwicklung', 19),
(44, 'Emotionale Entwicklung', 20),
(45, 'Emotionale Entwicklung', 21),
(46, 'Emotionale Entwicklung', 22),
(47, 'Emotionale Entwicklung', 23),
(48, 'Emotionale Entwicklung', 24),
(49, 'Emotionale Entwicklung', 25),
(50, 'Emotionale Entwicklung', 26),
(51, 'Emotionale Entwicklung', 27),
(52, 'Emotionale Entwicklung', 28);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `child`
--
ALTER TABLE `child`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sector_id` (`sector_id`);

--
-- Indexes for table `phases`
--
ALTER TABLE `phases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sectors`
--
ALTER TABLE `sectors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phase_id` (`phase_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `child`
--
ALTER TABLE `child`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=281;

--
-- AUTO_INCREMENT for table `phases`
--
ALTER TABLE `phases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `sectors`
--
ALTER TABLE `sectors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`sector_id`) REFERENCES `sectors` (`id`);

--
-- Constraints for table `sectors`
--
ALTER TABLE `sectors`
  ADD CONSTRAINT `sectors_ibfk_1` FOREIGN KEY (`phase_id`) REFERENCES `phases` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
