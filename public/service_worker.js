self.addEventListener("push", function (event) {
  var data = JSON.parse(event.data.text());
  var title = data.title;
  var message = data.message;
  var href = data.href;

  event.waitUntil(
    self.registration.showNotification(title, {
      body: message,
      data: { href: href }
    })
  )
});

self.addEventListener("notificationclick", function(event) {
  event.notification.close();
  event.waitUntil(
    clients.openWindow(event.notification.data.href)
  );
})
