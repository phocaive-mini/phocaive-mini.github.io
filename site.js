// phocaive.com 갈림길·앱 페이지 공통 — 언어 고르기 (비빌로그 페이지와 같은 규칙·같은 저장 키)
var LANGS = ['ko', 'en', 'ja', 'zh-Hans', 'zh-Hant', 'es-419'];

function detectLang() {
  try {
    var q = new URLSearchParams(location.search).get('lang');
    if (LANGS.indexOf(q) >= 0) return q;
  } catch (e) {}
  try {
    var saved = localStorage.getItem('bevillog-lang');
    if (LANGS.indexOf(saved) >= 0) return saved;
  } catch (e) {}
  var prefs = navigator.languages && navigator.languages.length ? navigator.languages : [navigator.language || 'en'];
  for (var i = 0; i < prefs.length; i++) {
    var l = String(prefs[i]).toLowerCase();
    if (l.indexOf('ko') === 0) return 'ko';
    if (l.indexOf('ja') === 0) return 'ja';
    if (l.indexOf('zh') === 0) return /hant|tw|hk|mo/.test(l) ? 'zh-Hant' : 'zh-Hans';
    if (l.indexOf('es') === 0) return 'es-419';
    if (l.indexOf('en') === 0) return 'en';
  }
  return 'en';
}

// T: { 언어: { title, desc, 칸이름: 문구 } } · 문구는 [data-i18n] 에, ?lang= 은 [data-lang-href] 링크에 붙임
function initLang(T) {
  var sel = document.getElementById('lang');
  function apply(lang) {
    var t = T[lang];
    document.documentElement.lang = lang;
    document.title = t.title;
    document.querySelector('meta[name="description"]').setAttribute('content', t.desc);
    document.querySelectorAll('[data-i18n]').forEach(function (el) {
      if (t[el.dataset.i18n] !== undefined) el.textContent = t[el.dataset.i18n];
    });
    document.querySelectorAll('[data-lang-file]').forEach(function (a) {
      a.href = a.dataset.langFile + lang + '.html';
    });
    document.querySelectorAll('[data-lang-href]').forEach(function (a) {
      a.href = a.dataset.langHref + '?lang=' + lang;
    });
    sel.value = lang;
  }
  sel.addEventListener('change', function () {
    try { localStorage.setItem('bevillog-lang', sel.value); } catch (e) {}
    apply(sel.value);
  });
  apply(detectLang());
  // 뒤로 가기로 저장된 화면이 되살아날 때 다른 페이지에서 바꾼 언어를 다시 반영
  // (주소의 ?lang= 보다 마지막에 고른 언어가 우선)
  window.addEventListener('pageshow', function (e) {
    if (!e.persisted) return;
    var saved = null;
    try { saved = localStorage.getItem('bevillog-lang'); } catch (err) {}
    apply(LANGS.indexOf(saved) >= 0 ? saved : detectLang());
  });
}
