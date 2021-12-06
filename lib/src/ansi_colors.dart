import 'std_io.dart' if (dart.library.html) 'std_web.dart';

/// Default ansi color for logger
class _AnsiColor {
  static String _color(int code, String v) => Std.supportAnsi ? '\u001b[38;5;${code}m$v' : v;

  static String blackSystem(String v) => _color(0, v);
  static String maroonSystem(String v) => _color(1, v);
  static String greenSystem(String v) => _color(2, v);
  static String oliveSystem(String v) => _color(3, v);
  static String navySystem(String v) => _color(4, v);
  static String purpleSystem(String v) => _color(5, v);
  static String tealSystem(String v) => _color(6, v);
  static String silverSystem(String v) => _color(7, v);
  static String greySystem(String v) => _color(8, v);
  static String redSystem(String v) => _color(9, v);
  static String limeSystem(String v) => _color(10, v);
  static String yellowSystem(String v) => _color(11, v);
  static String blueSystem(String v) => _color(12, v);
  static String fuchsiaSystem(String v) => _color(13, v);
  static String aquaSystem(String v) => _color(14, v);
  static String whiteSystem(String v) => _color(15, v);
  static String black(String v) => _color(16, v);
  static String navyBlue(String v) => _color(17, v);
  static String darkBlue(String v) => _color(18, v);
  static String dukeBlue(String v) => _color(19, v);
  static String mediumBlue(String v) => _color(20, v);
  static String blue(String v) => _color(21, v);
  static String darkGreen(String v) => _color(22, v);
  static String bangladeshGreen(String v) => _color(23, v);
  static String seaBlue(String v) => _color(24, v);
  static String mediumPersianBlue(String v) => _color(25, v);
  static String trueBlue(String v) => _color(26, v);
  static String brandeisBlue(String v) => _color(27, v);
  static String aoGreen(String v) => _color(28, v);
  static String spanishViridian(String v) => _color(29, v);
  static String darkCyan(String v) => _color(30, v);
  static String munsellBlue(String v) => _color(31, v);
  static String colaBlue(String v) => _color(32, v);
  static String azure(String v) => _color(33, v);
  static String islamicGreen(String v) => _color(34, v);
  static String goGreen(String v) => _color(35, v);
  static String persianGreen(String v) => _color(36, v);
  static String lightSeaGreen(String v) => _color(37, v);
  static String cyan(String v) => _color(38, v);
  static String blueBolt(String v) => _color(39, v);
  static String electricGreen(String v) => _color(40, v);
  static String malachite(String v) => _color(41, v);
  static String caribbeanGreenLight(String v) => _color(42, v);
  static String caribbeanGreen(String v) => _color(43, v);
  static String darkTurquoise(String v) => _color(44, v);
  static String vividSkyBlue(String v) => _color(45, v);
  static String green(String v) => _color(46, v);
  static String guppieGreen(String v) => _color(47, v);
  static String guppieGreenLight(String v) => _color(48, v);
  static String mediumSpringGreen(String v) => _color(49, v);
  static String seaGreen(String v) => _color(50, v);
  static String aqua(String v) => _color(51, v);
  static String bloodRed(String v) => _color(52, v);
  static String imperialPurple(String v) => _color(53, v);
  static String metallicViolet(String v) => _color(54, v);
  static String chinesePurple(String v) => _color(55, v);
  static String frenchViolet(String v) => _color(56, v);
  static String blueViolet(String v) => _color(57, v);
  static String bronzeYellow(String v) => _color(58, v);
  static String graniteGray(String v) => _color(59, v);
  static String uclaBlue(String v) => _color(60, v);
  static String liberty(String v) => _color(61, v);
  static String slateBlue(String v) => _color(62, v);
  static String veryLightBlue(String v) => _color(63, v);
  static String avocado(String v) => _color(64, v);
  static String russianGreen(String v) => _color(65, v);
  static String steelTeal(String v) => _color(66, v);
  static String rackley(String v) => _color(67, v);
  static String unitedNationsBlue(String v) => _color(68, v);
  static String blueberry(String v) => _color(69, v);
  static String kellyGreen(String v) => _color(70, v);
  static String forestGreen(String v) => _color(71, v);
  static String polishedPine(String v) => _color(72, v);
  static String crystalBlue(String v) => _color(73, v);
  static String carolinaBlue(String v) => _color(74, v);
  static String blueJeans(String v) => _color(75, v);
  static String harlequinGreen(String v) => _color(76, v);
  static String mantis(String v) => _color(77, v);
  static String veryLightMalachiteGreen(String v) => _color(78, v);
  static String mediumAquamarine(String v) => _color(79, v);
  static String mediumTurquoise(String v) => _color(80, v);
  static String mayaBlue(String v) => _color(81, v);
  static String brightGreen(String v) => _color(82, v);
  static String screaminGreen(String v) => _color(83, v);
  static String lightMalachiteGreen(String v) => _color(84, v);
  static String lightAquamarine(String v) => _color(85, v);
  static String aquamarine(String v) => _color(86, v);
  static String electricBlue(String v) => _color(87, v);
  static String deepRed(String v) => _color(88, v);
  static String frenchPlum(String v) => _color(89, v);
  static String mardiGras(String v) => _color(90, v);
  static String violet(String v) => _color(91, v);
  static String darkViolet(String v) => _color(92, v);
  static String electricViolet(String v) => _color(93, v);
  static String gambogeOrange(String v) => _color(94, v);
  static String deepTaupe(String v) => _color(95, v);
  static String chineseViolet(String v) => _color(96, v);
  static String royalPurple(String v) => _color(97, v);
  static String mediumPurple(String v) => _color(98, v);
  static String violetBlue(String v) => _color(99, v);
  static String olive(String v) => _color(100, v);
  static String shadow(String v) => _color(101, v);
  static String taupeGray(String v) => _color(102, v);
  static String coolGrey(String v) => _color(103, v);
  static String ube(String v) => _color(104, v);
  static String lightVioletBlue(String v) => _color(105, v);
  static String appleGreen(String v) => _color(106, v);
  static String asparagus(String v) => _color(107, v);
  static String darkSeaGreen(String v) => _color(108, v);
  static String pewterBlue(String v) => _color(109, v);
  static String lightCobaltBlue(String v) => _color(110, v);
  static String frenchSkyBlue(String v) => _color(111, v);
  static String alienArmpit(String v) => _color(112, v);
  static String lightMantis(String v) => _color(113, v);
  static String pastelGreen(String v) => _color(114, v);
  static String pearlAqua(String v) => _color(115, v);
  static String middleBlueGreen(String v) => _color(116, v);
  static String paleCyan(String v) => _color(117, v);
  static String chartreuse(String v) => _color(118, v);
  static String lightScreaminGreen(String v) => _color(119, v);
  static String lightGreen(String v) => _color(120, v);
  static String mintGreen(String v) => _color(121, v);
  static String alighterAquamarine(String v) => _color(122, v);
  static String heavenly(String v) => _color(123, v);
  static String darkCandyAppleRed(String v) => _color(124, v);
  static String jazzberryJam(String v) => _color(125, v);
  static String flirt(String v) => _color(126, v);
  static String heliotropeMagenta(String v) => _color(127, v);
  static String vividMulberry(String v) => _color(128, v);
  static String purple(String v) => _color(129, v);
  static String windsorTan(String v) => _color(130, v);
  static String electricBrown(String v) => _color(131, v);
  static String turkishRose(String v) => _color(132, v);
  static String pearlyPurple(String v) => _color(133, v);
  static String richLilac(String v) => _color(134, v);
  static String lavenderIndigo(String v) => _color(135, v);
  static String darkGoldenrod(String v) => _color(136, v);
  static String bronze(String v) => _color(137, v);
  static String englishLavender(String v) => _color(138, v);
  static String operaMauve(String v) => _color(139, v);
  static String lavender(String v) => _color(140, v);
  static String brightLavender(String v) => _color(141, v);
  static String lightGold(String v) => _color(142, v);
  static String oliveGreen(String v) => _color(143, v);
  static String sage(String v) => _color(144, v);
  static String silverFoil(String v) => _color(145, v);
  static String wildBlueYonder(String v) => _color(146, v);
  static String maximumBluePurple(String v) => _color(147, v);
  static String vividLimeGreen(String v) => _color(148, v);
  static String juneBud(String v) => _color(149, v);
  static String yellowGreen(String v) => _color(150, v);
  static String lightMossGreen(String v) => _color(151, v);
  static String crystal(String v) => _color(152, v);
  static String freshAir(String v) => _color(153, v);
  static String springBud(String v) => _color(154, v);
  static String inchworm(String v) => _color(155, v);
  static String lightMintGreen(String v) => _color(156, v);
  static String menthol(String v) => _color(157, v);
  static String magicMint(String v) => _color(158, v);
  static String celeste(String v) => _color(159, v);
  static String rossoCorsa(String v) => _color(160, v);
  static String royalRed(String v) => _color(161, v);
  static String mexicanPink(String v) => _color(162, v);
  static String deepMagenta(String v) => _color(163, v);
  static String deeperMagenta(String v) => _color(164, v);
  static String phlox(String v) => _color(165, v);
  static String tawny(String v) => _color(166, v);
  static String indianRed(String v) => _color(167, v);
  static String blush(String v) => _color(168, v);
  static String superPink(String v) => _color(169, v);
  static String orchid(String v) => _color(170, v);
  static String heliotrope(String v) => _color(171, v);
  static String harvestGold(String v) => _color(172, v);
  static String rawSienna(String v) => _color(173, v);
  static String newYorkPink(String v) => _color(174, v);
  static String middlePurple(String v) => _color(175, v);
  static String deepMauve(String v) => _color(176, v);
  static String brightLilac(String v) => _color(177, v);
  static String mustardYellow(String v) => _color(178, v);
  static String earthYellow(String v) => _color(179, v);
  static String tan(String v) => _color(180, v);
  static String paleChestnut(String v) => _color(181, v);
  static String pinkLavender(String v) => _color(182, v);
  static String mauve(String v) => _color(183, v);
  static String citrine(String v) => _color(184, v);
  static String chineseGreen(String v) => _color(185, v);
  static String mediumSpringBud(String v) => _color(186, v);
  static String pastelGray(String v) => _color(187, v);
  static String lightSilver(String v) => _color(188, v);
  static String paleLavender(String v) => _color(189, v);
  static String traditionalChartreuse(String v) => _color(190, v);
  static String maximumGreenYellow(String v) => _color(191, v);
  static String mindaro(String v) => _color(192, v);
  static String teaGreen(String v) => _color(193, v);
  static String nyanza(String v) => _color(194, v);
  static String lightCyan(String v) => _color(195, v);
  static String red(String v) => _color(196, v);
  static String vividRaspberry(String v) => _color(197, v);
  static String brightPink(String v) => _color(198, v);
  static String fashionFuchsia(String v) => _color(199, v);
  static String shockingPink(String v) => _color(200, v);
  static String fuchsia(String v) => _color(201, v);
  static String vividOrange(String v) => _color(202, v);
  static String pastelRed(String v) => _color(203, v);
  static String strawberry(String v) => _color(204, v);
  static String hotPink(String v) => _color(205, v);
  static String lightDeepPink(String v) => _color(206, v);
  static String crayolaShockingPink(String v) => _color(207, v);
  static String americanOrange(String v) => _color(208, v);
  static String coral(String v) => _color(209, v);
  static String tulip(String v) => _color(210, v);
  static String ticklePink(String v) => _color(211, v);
  static String princessPerfume(String v) => _color(212, v);
  static String fuchsiaPink(String v) => _color(213, v);
  static String chineseYellow(String v) => _color(214, v);
  static String sandyBrown(String v) => _color(215, v);
  static String macaroniAndCheese(String v) => _color(216, v);
  static String melon(String v) => _color(217, v);
  static String lavenderPink(String v) => _color(218, v);
  static String richBrilliantLavender(String v) => _color(219, v);
  static String gold(String v) => _color(220, v);
  static String naplesYellow(String v) => _color(221, v);
  static String jasmine(String v) => _color(222, v);
  static String lightOrange(String v) => _color(223, v);
  static String palePink(String v) => _color(224, v);
  static String pinkLace(String v) => _color(225, v);
  static String yellow(String v) => _color(226, v);
  static String laserLemon(String v) => _color(227, v);
  static String pastelYellow(String v) => _color(228, v);
  static String calamansi(String v) => _color(229, v);
  static String cream(String v) => _color(230, v);
  static String white(String v) => _color(231, v);
  static String vampireBlack(String v) => _color(232, v);
  static String chineseBlack(String v) => _color(233, v);
  static String eerieBlack(String v) => _color(234, v);
  static String raisinBlack(String v) => _color(235, v);
  static String darkCharcoal(String v) => _color(236, v);
  static String blackOlive(String v) => _color(237, v);
  static String outerSpace(String v) => _color(238, v);
  static String DarkLiver(String v) => _color(239, v);
  static String davysGrey(String v) => _color(240, v);
  static String grey39(String v) => _color(241, v);
  static String grey42(String v) => _color(242, v);
  static String grey46(String v) => _color(243, v);
  static String grey50(String v) => _color(244, v);
  static String grey54(String v) => _color(245, v);
  static String grey58(String v) => _color(246, v);
  static String grey62(String v) => _color(247, v);
  static String grey66(String v) => _color(248, v);
  static String grey70(String v) => _color(249, v);
  static String grey74(String v) => _color(250, v);
  static String grey78(String v) => _color(251, v);
  static String grey82(String v) => _color(252, v);
  static String grey85(String v) => _color(253, v);
  static String grey89(String v) => _color(254, v);
  static String grey93(String v) => _color(255, v);
}

enum AnsiColors {
  blackSystem,
  maroonSystem,
  greenSystem,
  oliveSystem,
  navySystem,
  purpleSystem,
  tealSystem,
  silverSystem,
  greySystem,
  redSystem,
  limeSystem,
  yellowSystem,
  blueSystem,
  fuchsiaSystem,
  aquaSystem,
  whiteSystem,
  black,
  navyBlue,
  darkBlue,
  dukeBlue,
  mediumBlue,
  blue,
  darkGreen,
  bangladeshGreen,
  seaBlue,
  mediumPersianBlue,
  trueBlue,
  brandeisBlue,
  aoGreen,
  spanishViridian,
  darkCyan,
  munsellBlue,
  colaBlue,
  azure,
  islamicGreen,
  goGreen,
  persianGreen,
  lightSeaGreen,
  cyan,
  blueBolt,
  electricGreen,
  malachite,
  caribbeanGreenLight,
  caribbeanGreen,
  darkTurquoise,
  vividSkyBlue,
  green,
  guppieGreen,
  guppieGreenLight,
  mediumSpringGreen,
  seaGreen,
  aqua,
  bloodRed,
  imperialPurple,
  metallicViolet,
  chinesePurple,
  frenchViolet,
  blueViolet,
  bronzeYellow,
  graniteGray,
  uclaBlue,
  liberty,
  slateBlue,
  veryLightBlue,
  avocado,
  russianGreen,
  steelTeal,
  rackley,
  unitedNationsBlue,
  blueberry,
  kellyGreen,
  forestGreen,
  polishedPine,
  crystalBlue,
  carolinaBlue,
  blueJeans,
  harlequinGreen,
  mantis,
  veryLightMalachiteGreen,
  mediumAquamarine,
  mediumTurquoise,
  mayaBlue,
  brightGreen,
  screaminGreen,
  lightMalachiteGreen,
  lightAquamarine,
  aquamarine,
  electricBlue,
  deepRed,
  frenchPlum,
  mardiGras,
  violet,
  darkViolet,
  electricViolet,
  gambogeOrange,
  deepTaupe,
  chineseViolet,
  royalPurple,
  mediumPurple,
  violetBlue,
  olive,
  shadow,
  taupeGray,
  coolGrey,
  ube,
  lightVioletBlue,
  appleGreen,
  asparagus,
  darkSeaGreen,
  pewterBlue,
  lightCobaltBlue,
  frenchSkyBlue,
  alienArmpit,
  lightMantis,
  pastelGreen,
  pearlAqua,
  middleBlueGreen,
  paleCyan,
  chartreuse,
  lightScreaminGreen,
  lightGreen,
  mintGreen,
  alighterAquamarine,
  heavenly,
  darkCandyAppleRed,
  jazzberryJam,
  flirt,
  heliotropeMagenta,
  vividMulberry,
  purple,
  windsorTan,
  electricBrown,
  turkishRose,
  pearlyPurple,
  richLilac,
  lavenderIndigo,
  darkGoldenrod,
  bronze,
  englishLavender,
  operaMauve,
  lavender,
  brightLavender,
  lightGold,
  oliveGreen,
  sage,
  silverFoil,
  wildBlueYonder,
  maximumBluePurple,
  vividLimeGreen,
  juneBud,
  yellowGreen,
  lightMossGreen,
  crystal,
  freshAir,
  springBud,
  inchworm,
  lightMintGreen,
  menthol,
  magicMint,
  celeste,
  rossoCorsa,
  royalRed,
  mexicanPink,
  deepMagenta,
  deeperMagenta,
  phlox,
  tawny,
  indianRed,
  blush,
  superPink,
  orchid,
  heliotrope,
  harvestGold,
  rawSienna,
  newYorkPink,
  middlePurple,
  deepMauve,
  brightLilac,
  mustardYellow,
  earthYellow,
  tan,
  paleChestnut,
  pinkLavender,
  mauve,
  citrine,
  chineseGreen,
  mediumSpringBud,
  pastelGray,
  lightSilver,
  paleLavender,
  traditionalChartreuse,
  maximumGreenYellow,
  mindaro,
  teaGreen,
  nyanza,
  lightCyan,
  red,
  vividRaspberry,
  brightPink,
  fashionFuchsia,
  shockingPink,
  fuchsia,
  vividOrange,
  pastelRed,
  strawberry,
  hotPink,
  lightDeepPink,
  crayolaShockingPink,
  americanOrange,
  coral,
  tulip,
  ticklePink,
  princessPerfume,
  fuchsiaPink,
  chineseYellow,
  sandyBrown,
  macaroniAndCheese,
  melon,
  lavenderPink,
  richBrilliantLavender,
  gold,
  naplesYellow,
  jasmine,
  lightOrange,
  palePink,
  pinkLace,
  yellow,
  laserLemon,
  pastelYellow,
  calamansi,
  cream,
  white,
  vampireBlack,
  chineseBlack,
  eerieBlack,
  raisinBlack,
  darkCharcoal,
  blackOlive,
  outerSpace,
  DarkLiver,
  davysGrey,
  grey39,
  grey42,
  grey46,
  grey50,
  grey54,
  grey58,
  grey62,
  grey66,
  grey70,
  grey74,
  grey78,
  grey82,
  grey85,
  grey89,
  grey93,
}

extension AnsiColorsExt on AnsiColors {
  String colorize(String v) {
    if (v == '') return '';
    if (v.startsWith('\u001b')) {
      v = v.replaceAll(RegExp(r'^\u001b\[38;5;[0-9]+m'), '');
    }
    switch (this) {
      case AnsiColors.blackSystem:
        return _AnsiColor.blackSystem(v);
      case AnsiColors.maroonSystem:
        return _AnsiColor.maroonSystem(v);
      case AnsiColors.greenSystem:
        return _AnsiColor.greenSystem(v);
      case AnsiColors.oliveSystem:
        return _AnsiColor.oliveSystem(v);
      case AnsiColors.navySystem:
        return _AnsiColor.navySystem(v);
      case AnsiColors.purpleSystem:
        return _AnsiColor.purpleSystem(v);
      case AnsiColors.tealSystem:
        return _AnsiColor.tealSystem(v);
      case AnsiColors.silverSystem:
        return _AnsiColor.silverSystem(v);
      case AnsiColors.greySystem:
        return _AnsiColor.greySystem(v);
      case AnsiColors.redSystem:
        return _AnsiColor.redSystem(v);
      case AnsiColors.limeSystem:
        return _AnsiColor.limeSystem(v);
      case AnsiColors.yellowSystem:
        return _AnsiColor.yellowSystem(v);
      case AnsiColors.blueSystem:
        return _AnsiColor.blueSystem(v);
      case AnsiColors.fuchsiaSystem:
        return _AnsiColor.fuchsiaSystem(v);
      case AnsiColors.aquaSystem:
        return _AnsiColor.aquaSystem(v);
      case AnsiColors.whiteSystem:
        return _AnsiColor.whiteSystem(v);
      case AnsiColors.black:
        return _AnsiColor.black(v);
      case AnsiColors.navyBlue:
        return _AnsiColor.navyBlue(v);
      case AnsiColors.darkBlue:
        return _AnsiColor.darkBlue(v);
      case AnsiColors.dukeBlue:
        return _AnsiColor.dukeBlue(v);
      case AnsiColors.mediumBlue:
        return _AnsiColor.mediumBlue(v);
      case AnsiColors.blue:
        return _AnsiColor.blue(v);
      case AnsiColors.darkGreen:
        return _AnsiColor.darkGreen(v);
      case AnsiColors.bangladeshGreen:
        return _AnsiColor.bangladeshGreen(v);
      case AnsiColors.seaBlue:
        return _AnsiColor.seaBlue(v);
      case AnsiColors.mediumPersianBlue:
        return _AnsiColor.mediumPersianBlue(v);
      case AnsiColors.trueBlue:
        return _AnsiColor.trueBlue(v);
      case AnsiColors.brandeisBlue:
        return _AnsiColor.brandeisBlue(v);
      case AnsiColors.aoGreen:
        return _AnsiColor.aoGreen(v);
      case AnsiColors.spanishViridian:
        return _AnsiColor.spanishViridian(v);
      case AnsiColors.darkCyan:
        return _AnsiColor.darkCyan(v);
      case AnsiColors.munsellBlue:
        return _AnsiColor.munsellBlue(v);
      case AnsiColors.colaBlue:
        return _AnsiColor.colaBlue(v);
      case AnsiColors.azure:
        return _AnsiColor.azure(v);
      case AnsiColors.islamicGreen:
        return _AnsiColor.islamicGreen(v);
      case AnsiColors.goGreen:
        return _AnsiColor.goGreen(v);
      case AnsiColors.persianGreen:
        return _AnsiColor.persianGreen(v);
      case AnsiColors.lightSeaGreen:
        return _AnsiColor.lightSeaGreen(v);
      case AnsiColors.cyan:
        return _AnsiColor.cyan(v);
      case AnsiColors.blueBolt:
        return _AnsiColor.blueBolt(v);
      case AnsiColors.electricGreen:
        return _AnsiColor.electricGreen(v);
      case AnsiColors.malachite:
        return _AnsiColor.malachite(v);
      case AnsiColors.caribbeanGreenLight:
        return _AnsiColor.caribbeanGreenLight(v);
      case AnsiColors.caribbeanGreen:
        return _AnsiColor.caribbeanGreen(v);
      case AnsiColors.darkTurquoise:
        return _AnsiColor.darkTurquoise(v);
      case AnsiColors.vividSkyBlue:
        return _AnsiColor.vividSkyBlue(v);
      case AnsiColors.green:
        return _AnsiColor.green(v);
      case AnsiColors.guppieGreen:
        return _AnsiColor.guppieGreen(v);
      case AnsiColors.guppieGreenLight:
        return _AnsiColor.guppieGreenLight(v);
      case AnsiColors.mediumSpringGreen:
        return _AnsiColor.mediumSpringGreen(v);
      case AnsiColors.seaGreen:
        return _AnsiColor.seaGreen(v);
      case AnsiColors.aqua:
        return _AnsiColor.aqua(v);
      case AnsiColors.bloodRed:
        return _AnsiColor.bloodRed(v);
      case AnsiColors.imperialPurple:
        return _AnsiColor.imperialPurple(v);
      case AnsiColors.metallicViolet:
        return _AnsiColor.metallicViolet(v);
      case AnsiColors.chinesePurple:
        return _AnsiColor.chinesePurple(v);
      case AnsiColors.frenchViolet:
        return _AnsiColor.frenchViolet(v);
      case AnsiColors.blueViolet:
        return _AnsiColor.blueViolet(v);
      case AnsiColors.bronzeYellow:
        return _AnsiColor.bronzeYellow(v);
      case AnsiColors.graniteGray:
        return _AnsiColor.graniteGray(v);
      case AnsiColors.uclaBlue:
        return _AnsiColor.uclaBlue(v);
      case AnsiColors.liberty:
        return _AnsiColor.liberty(v);
      case AnsiColors.slateBlue:
        return _AnsiColor.slateBlue(v);
      case AnsiColors.veryLightBlue:
        return _AnsiColor.veryLightBlue(v);
      case AnsiColors.avocado:
        return _AnsiColor.avocado(v);
      case AnsiColors.russianGreen:
        return _AnsiColor.russianGreen(v);
      case AnsiColors.steelTeal:
        return _AnsiColor.steelTeal(v);
      case AnsiColors.rackley:
        return _AnsiColor.rackley(v);
      case AnsiColors.unitedNationsBlue:
        return _AnsiColor.unitedNationsBlue(v);
      case AnsiColors.blueberry:
        return _AnsiColor.blueberry(v);
      case AnsiColors.kellyGreen:
        return _AnsiColor.kellyGreen(v);
      case AnsiColors.forestGreen:
        return _AnsiColor.forestGreen(v);
      case AnsiColors.polishedPine:
        return _AnsiColor.polishedPine(v);
      case AnsiColors.crystalBlue:
        return _AnsiColor.crystalBlue(v);
      case AnsiColors.carolinaBlue:
        return _AnsiColor.carolinaBlue(v);
      case AnsiColors.blueJeans:
        return _AnsiColor.blueJeans(v);
      case AnsiColors.harlequinGreen:
        return _AnsiColor.harlequinGreen(v);
      case AnsiColors.mantis:
        return _AnsiColor.mantis(v);
      case AnsiColors.veryLightMalachiteGreen:
        return _AnsiColor.veryLightMalachiteGreen(v);
      case AnsiColors.mediumAquamarine:
        return _AnsiColor.mediumAquamarine(v);
      case AnsiColors.mediumTurquoise:
        return _AnsiColor.mediumTurquoise(v);
      case AnsiColors.mayaBlue:
        return _AnsiColor.mayaBlue(v);
      case AnsiColors.brightGreen:
        return _AnsiColor.brightGreen(v);
      case AnsiColors.screaminGreen:
        return _AnsiColor.screaminGreen(v);
      case AnsiColors.lightMalachiteGreen:
        return _AnsiColor.lightMalachiteGreen(v);
      case AnsiColors.lightAquamarine:
        return _AnsiColor.lightAquamarine(v);
      case AnsiColors.aquamarine:
        return _AnsiColor.aquamarine(v);
      case AnsiColors.electricBlue:
        return _AnsiColor.electricBlue(v);
      case AnsiColors.deepRed:
        return _AnsiColor.deepRed(v);
      case AnsiColors.frenchPlum:
        return _AnsiColor.frenchPlum(v);
      case AnsiColors.mardiGras:
        return _AnsiColor.mardiGras(v);
      case AnsiColors.violet:
        return _AnsiColor.violet(v);
      case AnsiColors.darkViolet:
        return _AnsiColor.darkViolet(v);
      case AnsiColors.electricViolet:
        return _AnsiColor.electricViolet(v);
      case AnsiColors.gambogeOrange:
        return _AnsiColor.gambogeOrange(v);
      case AnsiColors.deepTaupe:
        return _AnsiColor.deepTaupe(v);
      case AnsiColors.chineseViolet:
        return _AnsiColor.chineseViolet(v);
      case AnsiColors.royalPurple:
        return _AnsiColor.royalPurple(v);
      case AnsiColors.mediumPurple:
        return _AnsiColor.mediumPurple(v);
      case AnsiColors.violetBlue:
        return _AnsiColor.violetBlue(v);
      case AnsiColors.olive:
        return _AnsiColor.olive(v);
      case AnsiColors.shadow:
        return _AnsiColor.shadow(v);
      case AnsiColors.taupeGray:
        return _AnsiColor.taupeGray(v);
      case AnsiColors.coolGrey:
        return _AnsiColor.coolGrey(v);
      case AnsiColors.ube:
        return _AnsiColor.ube(v);
      case AnsiColors.lightVioletBlue:
        return _AnsiColor.lightVioletBlue(v);
      case AnsiColors.appleGreen:
        return _AnsiColor.appleGreen(v);
      case AnsiColors.asparagus:
        return _AnsiColor.asparagus(v);
      case AnsiColors.darkSeaGreen:
        return _AnsiColor.darkSeaGreen(v);
      case AnsiColors.pewterBlue:
        return _AnsiColor.pewterBlue(v);
      case AnsiColors.lightCobaltBlue:
        return _AnsiColor.lightCobaltBlue(v);
      case AnsiColors.frenchSkyBlue:
        return _AnsiColor.frenchSkyBlue(v);
      case AnsiColors.alienArmpit:
        return _AnsiColor.alienArmpit(v);
      case AnsiColors.lightMantis:
        return _AnsiColor.lightMantis(v);
      case AnsiColors.pastelGreen:
        return _AnsiColor.pastelGreen(v);
      case AnsiColors.pearlAqua:
        return _AnsiColor.pearlAqua(v);
      case AnsiColors.middleBlueGreen:
        return _AnsiColor.middleBlueGreen(v);
      case AnsiColors.paleCyan:
        return _AnsiColor.paleCyan(v);
      case AnsiColors.chartreuse:
        return _AnsiColor.chartreuse(v);
      case AnsiColors.lightScreaminGreen:
        return _AnsiColor.lightScreaminGreen(v);
      case AnsiColors.lightGreen:
        return _AnsiColor.lightGreen(v);
      case AnsiColors.mintGreen:
        return _AnsiColor.mintGreen(v);
      case AnsiColors.alighterAquamarine:
        return _AnsiColor.alighterAquamarine(v);
      case AnsiColors.heavenly:
        return _AnsiColor.heavenly(v);
      case AnsiColors.darkCandyAppleRed:
        return _AnsiColor.darkCandyAppleRed(v);
      case AnsiColors.jazzberryJam:
        return _AnsiColor.jazzberryJam(v);
      case AnsiColors.flirt:
        return _AnsiColor.flirt(v);
      case AnsiColors.heliotropeMagenta:
        return _AnsiColor.heliotropeMagenta(v);
      case AnsiColors.vividMulberry:
        return _AnsiColor.vividMulberry(v);
      case AnsiColors.purple:
        return _AnsiColor.purple(v);
      case AnsiColors.windsorTan:
        return _AnsiColor.windsorTan(v);
      case AnsiColors.electricBrown:
        return _AnsiColor.electricBrown(v);
      case AnsiColors.turkishRose:
        return _AnsiColor.turkishRose(v);
      case AnsiColors.pearlyPurple:
        return _AnsiColor.pearlyPurple(v);
      case AnsiColors.richLilac:
        return _AnsiColor.richLilac(v);
      case AnsiColors.lavenderIndigo:
        return _AnsiColor.lavenderIndigo(v);
      case AnsiColors.darkGoldenrod:
        return _AnsiColor.darkGoldenrod(v);
      case AnsiColors.bronze:
        return _AnsiColor.bronze(v);
      case AnsiColors.englishLavender:
        return _AnsiColor.englishLavender(v);
      case AnsiColors.operaMauve:
        return _AnsiColor.operaMauve(v);
      case AnsiColors.lavender:
        return _AnsiColor.lavender(v);
      case AnsiColors.brightLavender:
        return _AnsiColor.brightLavender(v);
      case AnsiColors.lightGold:
        return _AnsiColor.lightGold(v);
      case AnsiColors.oliveGreen:
        return _AnsiColor.oliveGreen(v);
      case AnsiColors.sage:
        return _AnsiColor.sage(v);
      case AnsiColors.silverFoil:
        return _AnsiColor.silverFoil(v);
      case AnsiColors.wildBlueYonder:
        return _AnsiColor.wildBlueYonder(v);
      case AnsiColors.maximumBluePurple:
        return _AnsiColor.maximumBluePurple(v);
      case AnsiColors.vividLimeGreen:
        return _AnsiColor.vividLimeGreen(v);
      case AnsiColors.juneBud:
        return _AnsiColor.juneBud(v);
      case AnsiColors.yellowGreen:
        return _AnsiColor.yellowGreen(v);
      case AnsiColors.lightMossGreen:
        return _AnsiColor.lightMossGreen(v);
      case AnsiColors.crystal:
        return _AnsiColor.crystal(v);
      case AnsiColors.freshAir:
        return _AnsiColor.freshAir(v);
      case AnsiColors.springBud:
        return _AnsiColor.springBud(v);
      case AnsiColors.inchworm:
        return _AnsiColor.inchworm(v);
      case AnsiColors.lightMintGreen:
        return _AnsiColor.lightMintGreen(v);
      case AnsiColors.menthol:
        return _AnsiColor.menthol(v);
      case AnsiColors.magicMint:
        return _AnsiColor.magicMint(v);
      case AnsiColors.celeste:
        return _AnsiColor.celeste(v);
      case AnsiColors.rossoCorsa:
        return _AnsiColor.rossoCorsa(v);
      case AnsiColors.royalRed:
        return _AnsiColor.royalRed(v);
      case AnsiColors.mexicanPink:
        return _AnsiColor.mexicanPink(v);
      case AnsiColors.deepMagenta:
        return _AnsiColor.deepMagenta(v);
      case AnsiColors.deeperMagenta:
        return _AnsiColor.deeperMagenta(v);
      case AnsiColors.phlox:
        return _AnsiColor.phlox(v);
      case AnsiColors.tawny:
        return _AnsiColor.tawny(v);
      case AnsiColors.indianRed:
        return _AnsiColor.indianRed(v);
      case AnsiColors.blush:
        return _AnsiColor.blush(v);
      case AnsiColors.superPink:
        return _AnsiColor.superPink(v);
      case AnsiColors.orchid:
        return _AnsiColor.orchid(v);
      case AnsiColors.heliotrope:
        return _AnsiColor.heliotrope(v);
      case AnsiColors.harvestGold:
        return _AnsiColor.harvestGold(v);
      case AnsiColors.rawSienna:
        return _AnsiColor.rawSienna(v);
      case AnsiColors.newYorkPink:
        return _AnsiColor.newYorkPink(v);
      case AnsiColors.middlePurple:
        return _AnsiColor.middlePurple(v);
      case AnsiColors.deepMauve:
        return _AnsiColor.deepMauve(v);
      case AnsiColors.brightLilac:
        return _AnsiColor.brightLilac(v);
      case AnsiColors.mustardYellow:
        return _AnsiColor.mustardYellow(v);
      case AnsiColors.earthYellow:
        return _AnsiColor.earthYellow(v);
      case AnsiColors.tan:
        return _AnsiColor.tan(v);
      case AnsiColors.paleChestnut:
        return _AnsiColor.paleChestnut(v);
      case AnsiColors.pinkLavender:
        return _AnsiColor.pinkLavender(v);
      case AnsiColors.mauve:
        return _AnsiColor.mauve(v);
      case AnsiColors.citrine:
        return _AnsiColor.citrine(v);
      case AnsiColors.chineseGreen:
        return _AnsiColor.chineseGreen(v);
      case AnsiColors.mediumSpringBud:
        return _AnsiColor.mediumSpringBud(v);
      case AnsiColors.pastelGray:
        return _AnsiColor.pastelGray(v);
      case AnsiColors.lightSilver:
        return _AnsiColor.lightSilver(v);
      case AnsiColors.paleLavender:
        return _AnsiColor.paleLavender(v);
      case AnsiColors.traditionalChartreuse:
        return _AnsiColor.traditionalChartreuse(v);
      case AnsiColors.maximumGreenYellow:
        return _AnsiColor.maximumGreenYellow(v);
      case AnsiColors.mindaro:
        return _AnsiColor.mindaro(v);
      case AnsiColors.teaGreen:
        return _AnsiColor.teaGreen(v);
      case AnsiColors.nyanza:
        return _AnsiColor.nyanza(v);
      case AnsiColors.lightCyan:
        return _AnsiColor.lightCyan(v);
      case AnsiColors.red:
        return _AnsiColor.red(v);
      case AnsiColors.vividRaspberry:
        return _AnsiColor.vividRaspberry(v);
      case AnsiColors.brightPink:
        return _AnsiColor.brightPink(v);
      case AnsiColors.fashionFuchsia:
        return _AnsiColor.fashionFuchsia(v);
      case AnsiColors.shockingPink:
        return _AnsiColor.shockingPink(v);
      case AnsiColors.fuchsia:
        return _AnsiColor.fuchsia(v);
      case AnsiColors.vividOrange:
        return _AnsiColor.vividOrange(v);
      case AnsiColors.pastelRed:
        return _AnsiColor.pastelRed(v);
      case AnsiColors.strawberry:
        return _AnsiColor.strawberry(v);
      case AnsiColors.hotPink:
        return _AnsiColor.hotPink(v);
      case AnsiColors.lightDeepPink:
        return _AnsiColor.lightDeepPink(v);
      case AnsiColors.crayolaShockingPink:
        return _AnsiColor.crayolaShockingPink(v);
      case AnsiColors.americanOrange:
        return _AnsiColor.americanOrange(v);
      case AnsiColors.coral:
        return _AnsiColor.coral(v);
      case AnsiColors.tulip:
        return _AnsiColor.tulip(v);
      case AnsiColors.ticklePink:
        return _AnsiColor.ticklePink(v);
      case AnsiColors.princessPerfume:
        return _AnsiColor.princessPerfume(v);
      case AnsiColors.fuchsiaPink:
        return _AnsiColor.fuchsiaPink(v);
      case AnsiColors.chineseYellow:
        return _AnsiColor.chineseYellow(v);
      case AnsiColors.sandyBrown:
        return _AnsiColor.sandyBrown(v);
      case AnsiColors.macaroniAndCheese:
        return _AnsiColor.macaroniAndCheese(v);
      case AnsiColors.melon:
        return _AnsiColor.melon(v);
      case AnsiColors.lavenderPink:
        return _AnsiColor.lavenderPink(v);
      case AnsiColors.richBrilliantLavender:
        return _AnsiColor.richBrilliantLavender(v);
      case AnsiColors.gold:
        return _AnsiColor.gold(v);
      case AnsiColors.naplesYellow:
        return _AnsiColor.naplesYellow(v);
      case AnsiColors.jasmine:
        return _AnsiColor.jasmine(v);
      case AnsiColors.lightOrange:
        return _AnsiColor.lightOrange(v);
      case AnsiColors.palePink:
        return _AnsiColor.palePink(v);
      case AnsiColors.pinkLace:
        return _AnsiColor.pinkLace(v);
      case AnsiColors.yellow:
        return _AnsiColor.yellow(v);
      case AnsiColors.laserLemon:
        return _AnsiColor.laserLemon(v);
      case AnsiColors.pastelYellow:
        return _AnsiColor.pastelYellow(v);
      case AnsiColors.calamansi:
        return _AnsiColor.calamansi(v);
      case AnsiColors.cream:
        return _AnsiColor.cream(v);
      case AnsiColors.white:
        return _AnsiColor.white(v);
      case AnsiColors.vampireBlack:
        return _AnsiColor.vampireBlack(v);
      case AnsiColors.chineseBlack:
        return _AnsiColor.chineseBlack(v);
      case AnsiColors.eerieBlack:
        return _AnsiColor.eerieBlack(v);
      case AnsiColors.raisinBlack:
        return _AnsiColor.raisinBlack(v);
      case AnsiColors.darkCharcoal:
        return _AnsiColor.darkCharcoal(v);
      case AnsiColors.blackOlive:
        return _AnsiColor.blackOlive(v);
      case AnsiColors.outerSpace:
        return _AnsiColor.outerSpace(v);
      case AnsiColors.DarkLiver:
        return _AnsiColor.DarkLiver(v);
      case AnsiColors.davysGrey:
        return _AnsiColor.davysGrey(v);
      case AnsiColors.grey39:
        return _AnsiColor.grey39(v);
      case AnsiColors.grey42:
        return _AnsiColor.grey42(v);
      case AnsiColors.grey46:
        return _AnsiColor.grey46(v);
      case AnsiColors.grey50:
        return _AnsiColor.grey50(v);
      case AnsiColors.grey54:
        return _AnsiColor.grey54(v);
      case AnsiColors.grey58:
        return _AnsiColor.grey58(v);
      case AnsiColors.grey62:
        return _AnsiColor.grey62(v);
      case AnsiColors.grey66:
        return _AnsiColor.grey66(v);
      case AnsiColors.grey70:
        return _AnsiColor.grey70(v);
      case AnsiColors.grey74:
        return _AnsiColor.grey74(v);
      case AnsiColors.grey78:
        return _AnsiColor.grey78(v);
      case AnsiColors.grey82:
        return _AnsiColor.grey82(v);
      case AnsiColors.grey85:
        return _AnsiColor.grey85(v);
      case AnsiColors.grey89:
        return _AnsiColor.grey89(v);
      case AnsiColors.grey93:
        return _AnsiColor.grey93(v);
    }
  }
}
