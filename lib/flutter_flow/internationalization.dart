import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['pt', 'en', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ptText = '',
    String? enText = '',
    String? esText = '',
  }) =>
      [ptText, enText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'w1nen5a8': {
      'pt': 'Fala Comigo!',
      'en': 'Talk to me!',
      'es': 'Habla conmigo!',
    },
    '1sx9wyiq': {
      'pt': 'Aba Terapeutica\n',
      'en': '',
      'es': '',
    },
    'ic1cmnkh': {
      'pt': 'Falar',
      'en': 'Talk',
      'es': 'Hablar',
    },
    '106tnc5g': {
      'pt': 'Configurações',
      'en': 'Settings',
      'es': 'Configuraciones',
    },
    'ersffkwj': {
      'pt': 'Laboratório',
      'en': 'Create Buttons',
      'es': 'Criar botón',
    },
    'fm1j7prf': {
      'pt': '©helitito',
      'en': '',
      'es': '',
    },
    '86cfz35n': {
      'pt': 'Início',
      'en': 'Home',
      'es': 'Início',
    },
  },
  // Configs
  {
    'w01drlpl': {
      'pt': 'Configurações\n',
      'en': '',
      'es': '',
    },
    'jgwpjzca': {
      'pt': 'Modo escuro',
      'en': '',
      'es': '',
    },
    'tlutu46p': {
      'pt': 'Suporte\n',
      'en': '',
      'es': '',
    },
  },
  // falar
  {
    'cd2dcgun': {
      'pt': 'Categorias',
      'en': '',
      'es': '',
    },
    'tf4yjmo7': {
      'pt': 'Teclado',
      'en': '',
      'es': '',
    },
    '0vqut6b9': {
      'pt': 'Pessoas',
      'en': '',
      'es': '',
    },
    'e3v4gnuw': {
      'pt': 'Verbos',
      'en': '',
      'es': '',
    },
    'w7cyouso': {
      'pt': 'Cores',
      'en': '',
      'es': '',
    },
    'o02by56d': {
      'pt': 'Lugares',
      'en': '',
      'es': '',
    },
    'ehs2rthp': {
      'pt': 'Bebidas',
      'en': '',
      'es': '',
    },
    'tx89ea5u': {
      'pt': 'Emoções',
      'en': '',
      'es': '',
    },
    'a57eu0dy': {
      'pt': 'Falar!',
      'en': '',
      'es': '',
    },
    '1v4it910': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // Cores
  {
    '5ut9tjqv': {
      'pt': 'Falar!',
      'en': '',
      'es': '',
    },
    'v7e740lc': {
      'pt': 'Cores',
      'en': '',
      'es': '',
    },
    'tjvrpou7': {
      'pt': 'Laranja',
      'en': '',
      'es': '',
    },
    'x8dtqs4s': {
      'pt': 'Preto',
      'en': '',
      'es': '',
    },
    'ihd5dd1k': {
      'pt': 'Azul',
      'en': '',
      'es': '',
    },
    'imnvrcvg': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // AbaTerapeutica
  {
    '6yja1qbi': {
      'pt':
          'Esta aba não está pronta ainda :(\nmas não se preucope que ja ja ela fica disponível!\n:)\nClique na tela pra voltar a pagina inicial\n',
      'en': '',
      'es': '',
    },
    '0px82yux': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // CriarBotao
  {
    'q985irc6': {
      'pt': 'Nome do Botão...',
      'en': '',
      'es': '',
    },
    '7vc3l88c': {
      'pt': 'Descrição...\n',
      'en': '',
      'es': '',
    },
    'fvu1n4xi': {
      'pt': 'Categoria:',
      'en': '',
      'es': '',
    },
    'ormlcmyy': {
      'pt': 'Create Product',
      'en': '',
      'es': '',
    },
    'vxj0h8cm': {
      'pt': 'TextField',
      'en': '',
      'es': '',
    },
    'vday8vk2': {
      'pt': 'Criar Botão\n',
      'en': '',
      'es': '',
    },
    'igcymcn5': {
      'pt': 'Agora é só preencher os dados!\n',
      'en': '',
      'es': '',
    },
    '8q4gxmpz': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // Verbos
  {
    '2t55eksm': {
      'pt': 'Falar!',
      'en': '',
      'es': '',
    },
    '8z91wjkc': {
      'pt': 'Verbos',
      'en': '',
      'es': '',
    },
    'zmitxckb': {
      'pt': 'Quero\n',
      'en': '',
      'es': '',
    },
    't0putkon': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // Pessoas
  {
    'oy4xe448': {
      'pt': 'Falar!',
      'en': '',
      'es': '',
    },
    'n1u117b0': {
      'pt': 'Pessoas',
      'en': '',
      'es': '',
    },
    'hsue3lyj': {
      'pt': 'Eu\n',
      'en': '',
      'es': '',
    },
    'onm2xea6': {
      'pt': 'Pai\n',
      'en': '',
      'es': '',
    },
    '7k0tcdbq': {
      'pt': 'Mãe\n',
      'en': '',
      'es': '',
    },
    'ztj7llay': {
      'pt': 'Terapeuta\n',
      'en': '',
      'es': '',
    },
    '3q1tu6ou': {
      'pt': 'Professor\n',
      'en': '',
      'es': '',
    },
    '0laj2mwb': {
      'pt': 'Amigo',
      'en': '',
      'es': '',
    },
    '8a9ghgzh': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // Lab
  {
    'cq5za1j2': {
      'pt': 'Criar',
      'en': '',
      'es': '',
    },
    'uix9ghx5': {
      'pt': 'Laboratorio',
      'en': '',
      'es': '',
    },
    'szdv2uha': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // Comida
  {
    'n33wirjg': {
      'pt': 'Falar!',
      'en': '',
      'es': '',
    },
    'jwz6ocyr': {
      'pt': 'Comidas',
      'en': '',
      'es': '',
    },
    '21n0emwv': {
      'pt': 'Sanduiche',
      'en': '',
      'es': '',
    },
    'b6q9jkij': {
      'pt': 'Maçã',
      'en': '',
      'es': '',
    },
    'edq6hcvn': {
      'pt': 'Carne',
      'en': '',
      'es': '',
    },
    'aiqgqzqu': {
      'pt': 'Banana',
      'en': '',
      'es': '',
    },
    'tex7wepj': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // Lugares
  {
    'ksz04tt5': {
      'pt': 'Lugares',
      'en': '',
      'es': '',
    },
    'gf3xid2x': {
      'pt': 'Casa',
      'en': '',
      'es': '',
    },
    'bxzv8fz6': {
      'pt': 'Falar!',
      'en': '',
      'es': '',
    },
    'zcj4blz8': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // Bebidas
  {
    'nasrs398': {
      'pt': 'Falar!',
      'en': '',
      'es': '',
    },
    'yvk8volg': {
      'pt': 'Bebidas',
      'en': '',
      'es': '',
    },
    'tbkzofxh': {
      'pt': 'Água',
      'en': '',
      'es': '',
    },
    'zbrtscsl': {
      'pt': 'Achocolatado',
      'en': '',
      'es': '',
    },
    'ex1in6ay': {
      'pt': 'Suco de uva',
      'en': '',
      'es': '',
    },
    'g6oynrnw': {
      'pt': 'Suco de Laranja',
      'en': '',
      'es': '',
    },
    '6wmgriha': {
      'pt': 'Leite',
      'en': '',
      'es': '',
    },
    't87mbogz': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // emocoes
  {
    'jmprp9dq': {
      'pt': 'Falar!',
      'en': '',
      'es': '',
    },
    'ooo7mbsg': {
      'pt': 'Emoções',
      'en': '',
      'es': '',
    },
    'zzjd118z': {
      'pt': 'Fome\n',
      'en': '',
      'es': '',
    },
    '5rcbw5yt': {
      'pt': 'Feliz\n',
      'en': '',
      'es': '',
    },
    'hlytimcs': {
      'pt': 'Triste',
      'en': '',
      'es': '',
    },
    'xxwvi5ju': {
      'pt': 'Sim\n',
      'en': '',
      'es': '',
    },
    'w00y5bwh': {
      'pt': 'Não\n',
      'en': '',
      'es': '',
    },
    'f8mrdqch': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // Teclado
  {
    'ipx9oixc': {
      'pt': 'Digite Aqui',
      'en': '',
      'es': '',
    },
    'qt6aahit': {
      'pt': 'Play',
      'en': '',
      'es': '',
    },
    'dwrhzfyl': {
      'pt': 'Pause',
      'en': '',
      'es': '',
    },
    'vinzs8r9': {
      'pt': 'Parar',
      'en': '',
      'es': '',
    },
    '51glph18': {
      'pt': 'Pitch',
      'en': '',
      'es': '',
    },
    'nxbo6jqa': {
      'pt': 'Volume',
      'en': '',
      'es': '',
    },
    'g1fg77u7': {
      'pt': 'Velocidade',
      'en': '',
      'es': '',
    },
    'uln22c17': {
      'pt': 'Teclado',
      'en': '',
      'es': '',
    },
    'pkxgu0qn': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // Brinquedos
  {
    'rgk8xwo8': {
      'pt': 'Falar!',
      'en': '',
      'es': '',
    },
    'v4vrnmpu': {
      'pt': 'Brinquedos',
      'en': '',
      'es': '',
    },
    'ckpcjfh2': {
      'pt': 'Lego',
      'en': '',
      'es': '',
    },
    '7gihcei2': {
      'pt': 'Carrinho',
      'en': '',
      'es': '',
    },
    'ghmjhs5w': {
      'pt': 'Boneco',
      'en': '',
      'es': '',
    },
    'sk9ynjr9': {
      'pt': 'Bicicleta',
      'en': '',
      'es': '',
    },
    'sbuf305i': {
      'pt': 'Bola',
      'en': '',
      'es': '',
    },
    '1tz731qh': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // Login
  {
    'e8zuik6a': {
      'pt': 'Login',
      'en': '',
      'es': '',
    },
    'bwpt598p': {
      'pt': 'Faça Login usando sua conta abaixo!',
      'en': '',
      'es': '',
    },
    'drr58t5o': {
      'pt': 'Email',
      'en': '',
      'es': '',
    },
    'vl2bgogq': {
      'pt': 'Senha',
      'en': '',
      'es': '',
    },
    '9ve7k8py': {
      'pt': 'Logar',
      'en': '',
      'es': '',
    },
    '5rvnyv0h': {
      'pt': 'Esqueceu a Senha',
      'en': '',
      'es': '',
    },
    '8od3xoii': {
      'pt': 'Ou faça login com',
      'en': '',
      'es': '',
    },
    'dumqouww': {
      'pt': 'Continar com  Google',
      'en': '',
      'es': '',
    },
    '9mg51a0a': {
      'pt': 'Continuar com Apple',
      'en': '',
      'es': '',
    },
    '63vz43cb': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // ForgotPassword
  {
    '40b6cdfa': {
      'pt': 'Back',
      'en': '',
      'es': '',
    },
    'ukzcq26u': {
      'pt': 'Esqueceu a Senha',
      'en': '',
      'es': '',
    },
    'ck8p1w21': {
      'pt': 'Mandaremos um email para você redefinir sua senha:',
      'en': '',
      'es': '',
    },
    'x977aif9': {
      'pt': 'Seu E-mail...',
      'en': '',
      'es': '',
    },
    'm0e75l7u': {
      'pt': 'Digite seu E-mail...',
      'en': '',
      'es': '',
    },
    'i3s969g1': {
      'pt': 'Send Link',
      'en': '',
      'es': '',
    },
    'yn29eur9': {
      'pt': 'Back',
      'en': '',
      'es': '',
    },
    'm5z37ews': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // Miscellaneous
  {
    '9kw1s81y': {
      'pt': 'Modo Claro',
      'en': '',
      'es': '',
    },
    'kr8pxuq6': {
      'pt': 'Modo Escuro',
      'en': '',
      'es': '',
    },
    'm9uznt6p': {
      'pt': '\n',
      'en': '',
      'es': '',
    },
    'zp25woun': {
      'pt': 'Para tirar fotos, este app precisa de acesso à camera.',
      'en': '',
      'es': '',
    },
    'xz37gf07': {
      'pt': 'Para escolher uma foto, este app precisa de acesso à galeria.',
      'en': '',
      'es': '',
    },
    '8k1xzeju': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'gdf78ypi': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '1wnuqkuh': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'xgyzudq9': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '7tgtfyp7': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '1ffgby2r': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'qh2ipupr': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '1vft1eoy': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'e60wepho': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'b2zfzmgo': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'sern1o1g': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'qh2z0er3': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '9cmi96z9': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '8ati05j2': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'bcsgozom': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'lhmvm5ti': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '5z74hu0t': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '31pwoc0o': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '6c4920tk': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'uz2c89v5': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '5teuvpeo': {
      'pt': '',
      'en': '',
      'es': '',
    },
    't73m5mjc': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'b9typtea': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'jr6z3cb8': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'glqsoval': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'vgzy8r05': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '5bezdrw1': {
      'pt': '',
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
