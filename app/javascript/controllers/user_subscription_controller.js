import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    vapid: Array,
    endpoint: Array,
    url: String
  }

  connect() {
    if (navigator.serviceWorker) {
      navigator.serviceWorker.register('/service_worker.js', { scope: './' })
        .then(this.subscribeToPushNotification());
    } else {
      console.error("Service worker is not supported in this browser");
    }
  }

  subscribeToPushNotification(reg) {
    var vapidPublicKey = new Uint8Array(this.vapidValue);
    var urlValue = this.urlValue;
    var endpointValue = this.endpointValue;
    navigator.serviceWorker.ready.then((serviceWorkerRegistration) => {
      serviceWorkerRegistration.pushManager
        .subscribe({
          userVisibleOnly: true,
          applicationServerKey: vapidPublicKey
        }).then(async function (subscription) {
          if (!endpointValue.includes(subscription.endpoint)) {
            await fetch(urlValue, {
              method: "POST",
              headers: {
                "Content-Type": "application/json",
              },
              body: JSON.stringify(subscription),
            });
          }
        });
    });
  }
}
