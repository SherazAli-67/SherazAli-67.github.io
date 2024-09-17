'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "576b6dd2d4f2a37167d11b2cc642dcbd",
"version.json": "009c9e65172e010890f7f65fde438006",
"index.html": "c1c5f29031926111ab3ccb7c551c88f9",
"/": "c1c5f29031926111ab3ccb7c551c88f9",
"main.dart.js": "d19940a81647d0c2594a755462c942c1",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "d40c47d1c161f94dbcb13094d37f1f55",
"assets/AssetManifest.json": "84a84f07ab0fe2b4f975d61ec8fe38b6",
"assets/NOTICES": "f117a7dd1236e6f9466c859d8ec69085",
"assets/FontManifest.json": "f314b33656f401887c23456cefaf5637",
"assets/AssetManifest.bin.json": "99f43ff318a405ffc73074cd607f2163",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "061377289aa992ee1df1467387fadf46",
"assets/fonts/MaterialIcons-Regular.otf": "e91b52fb17e5215948674c2802ee79c2",
"assets/assets/tech_stack_icons/ic_postman.svg": "b1da0ce311cdcf951f3a22ff932e4279",
"assets/assets/tech_stack_icons/ic_mongodb.svg": "77d3abd50d2cfb97392953684e8a5d84",
"assets/assets/tech_stack_icons/ic_java.svg": "3eb946d940460592b44f8c89c4b0ee80",
"assets/assets/tech_stack_icons/ic_flutter.svg": "89efbb86e5ec94dc698311119e3a2ba1",
"assets/assets/tech_stack_icons/ic_firebase.svg": "8fa4b15c6afcb545db11f09d33f8a4c1",
"assets/assets/tech_stack_icons/ic_visual_studio.svg": "480aadfc4c32007ceaac4c7a3f6b193f",
"assets/assets/tech_stack_icons/ic_android.svg": "a2b510627c01f62a9769e94426ec8efd",
"assets/assets/tech_stack_icons/ic_dart.svg": "75485ef4c0f8d66d306186a62ff381dc",
"assets/assets/tech_stack_icons/ic_android_studio.svg": "293521bbce34a78acc091886b19fb813",
"assets/assets/tech_stack_icons/ic_github.svg": "6da8b984bddf22a320ce2af292002208",
"assets/assets/tech_stack_icons/ic_gitlab.svg": "3347e73901d6323264228fd471a4cdfe",
"assets/assets/projects/markets_ai.png": "e873251e4a535a97b15fd168f341e180",
"assets/assets/projects/code_of_civil_procedure.png": "9e52b4d5dd1b5edc04b41840353b0e22",
"assets/assets/projects/happylife.png": "432236a8af6f5e19ddc23f253c62ca0e",
"assets/assets/projects/custom_tees.png": "d287fc3c7838b5d58b01cf1880ef24ff",
"assets/assets/projects/konushan.png": "2fe8df7b8c883757417989b3d254bfcc",
"assets/assets/icons/ic_mail.svg": "b52330915069b07db6807b3f87a04a52",
"assets/assets/icons/ic_share.svg": "684370a071bca89eb9801396527542b3",
"assets/assets/icons/googleplay.png": "d4c5e2af439c594656d7dd85f6f14999",
"assets/assets/icons/ic_twitter.svg": "8d2f2852f395e2df2aefb8a23b8b26fb",
"assets/assets/icons/logo_light_theme.png": "acd3395087d9cb79663db60f4648d41d",
"assets/assets/icons/developer_me.png": "1db33a78cf0abb64d661cca6b0b5d9d7",
"assets/assets/icons/ic_light_mode_enabled.svg": "201ec9f264efd138616dbca21293d230",
"assets/assets/icons/tobuildLLC.jpeg": "f8888a29383689010ffc70925254ea00",
"assets/assets/icons/ic_code.svg": "65870a3efcdfe7792dde3fba6b0a877a",
"assets/assets/icons/ic_home.svg": "b5b1cb5f945cd125f7c96cf64ac7bbdd",
"assets/assets/icons/ic_skills.svg": "5343480d01f009d01c83a7092d1494e7",
"assets/assets/icons/ic_user.svg": "b51356eb85cb5fe35f257f4d9cb7259a",
"assets/assets/icons/fiverr_upwork.png": "9724becfced43eb8aa2baacab9f807ed",
"assets/assets/icons/ic_blogs.svg": "abbbf0c022a97248460de95d04072831",
"assets/assets/icons/ic_linkedIn.svg": "61fa2fdec163c0b046d521ffbfd01003",
"assets/assets/icons/appstore.png": "c3a8e990a67894f42dd27f9d1b848c21",
"assets/assets/icons/ic_call.svg": "b60879bfbd9ad329a2087c220725df63",
"assets/assets/icons/ic_dark_mode_enabled.svg": "027bfa4a972432623be05c29e0d39483",
"assets/assets/icons/ic_app_icon.svg": "2746a1ac35ecf37b4ca60b54269dd805",
"assets/assets/icons/ic_download.svg": "7822f46cd93fb6219876a97940afe667",
"assets/assets/icons/ic_contact.svg": "b60879bfbd9ad329a2087c220725df63",
"assets/assets/icons/ic_copy.svg": "457c24d1d19acc87f9794e40173ee4e4",
"assets/assets/icons/zetsol_logo.png": "9a4e2b50b544634acd45c4ddf0506c09",
"assets/assets/icons/logo_dark_theme.png": "444e18aac0f1eb155ab9a8ab8171a1f2",
"assets/assets/icons/ic_github.svg": "d5f792bb47bfa93080c82527bc7acd05",
"assets/assets/fonts/Montserrat-Medium.ttf": "bdb7ba651b7bdcda6ce527b3b6705334",
"assets/assets/fonts/Poppins-Medium.ttf": "bf59c687bc6d3a70204d3944082c5cc0",
"assets/assets/fonts/Montserrat-Bold.ttf": "ed86af2ed5bbaf879e9f2ec2e2eac929",
"assets/assets/fonts/Poppins-Regular.ttf": "093ee89be9ede30383f39a899c485a82",
"assets/assets/fonts/Montserrat-Regular.ttf": "5e077c15f6e1d334dd4e9be62b28ac75",
"assets/assets/fonts/Poppins-Bold.ttf": "08c20a487911694291bd8c5de41315ad",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
