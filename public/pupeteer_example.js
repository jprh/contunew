// const puppeteer = require('puppeteer')
// const screenshot = 'booking_results.png'
// try {
//     (async () => {
//         const browser = await puppeteer.launch()
//         const page = await browser.newPage()
//         await page.goto('https://booking.com')
//         await page.type('#ss', 'Berlin')
//         await page.click('.sb-searchbox__button')
//         await page.waitForSelector('#hotellist_inner')
//         await page.screenshot({ path: screenshot })
//         const hotels = await page.$$eval('span.sr-hotel__name', anchors => {
//             return anchors.map(anchor => anchor.textContent.trim()).slice(0, 10)
//         })
//         console.log(hotels)
//         await browser.close()
//         console.log('See screenshot: ' + screenshot)
//     })()
// } catch (err) {
//     console.error(err)
// }

// const puppeteer = require('puppeteer');

// (async () => {
//     const browser = await puppeteer.launch()
//     const page = await browser.newPage()
//     await page.goto('https://www.google.com/')
//     page.on('dialog', async dialog => {
//         console.log(dialog.message())
//         await dialog.dismiss()
//     })
//     await page.evaluate(() => alert('This message is inside an alert box'))
//     await browser.close()
// })()

const puppeteer = import('puppeteer');

(async () => {
    const browser = await puppeteer.launch()
    const page = await browser.newPage()
    await page.tracing.start({
        path: 'trace.json',
        categories: ['devtools.timeline']
    })
    await page.goto('https://news.ycombinator.com/news')

    // execute standard javascript in the context of the page.
    const stories = await page.$$eval('a.storylink', anchors => { return anchors.map(anchor => anchor.textContent).slice(0, 10) })
    console.log(stories)
    await page.tracing.stop()
    await browser.close()
})();


// const puppeteer = require('puppeteer')
// const screenshot = 'amazon_nyan_cat_pullover.png'
// try {
//   (async () => {
//     const browser = await puppeteer.launch()
//     const page = await browser.newPage()
//     await page.setViewport({ width: 1280, height: 800 })
//     await page.goto('https://www.amazon.com')
//     await page.type('#twotabsearchtextbox', 'nyan cat pullover')
//     await page.click('input.nav-input')
//     await page.waitForSelector('#resultsCol')
//     await page.screenshot({ path: 'amazon_nyan_cat_pullovers_list.png' })
//     await page.click('#pagnNextString')
//     await page.waitForSelector('#resultsCol')
//     const pullovers = await page.$$('a.a-link-normal.a-text-normal')
//     await pullovers[2].click()
//     await page.waitForSelector('#ppd')
//     await page.screenshot({ path: screenshot })
//     await browser.close()
//     console.log('See screenshot: ' + screenshot)
//   })()
// } catch (err) {
//   console.error(err)
// }

// const puppeteer = require('puppeteer');

// (async () => {
//     const browser = await puppeteer.launch()
//     const page = await browser.newPage()
//     await page.goto('https://news.ycombinator.com/news')
//     const name = await page.$eval('.hnname > a', el => el.innerText)
//     console.log(name)
//     await browser.close()
// })()

//     $('#priceblock_dealprice', html).each(function () {
//         let dollarPrice = $(this).text();
//         // console.log(dollarPrice);
//         let currentPrice = Number(dollarPrice.replace(/[^0-9.-]+/g, ""));

//         if (currentPrice < 300) {
//             console.log("BUY!!!! " + currentPrice);
//             sendNotification(currentPrice);
//         }
//     });
// }

// async function startTracking() {
//     const page = await configureBrowser();

//     let job = new CronJob('* */30 * * * *', function () { //runs every 30 minutes in this config
//         checkPrice(page);
//     }, null, true, null, null, true);
//     job.start();
// }

// async function sendNotification(price) {

//     let transporter = nodemailer.createTransport({
//         service: 'gmail',
//         auth: {
//             user: '*****@gmail.com',
//             pass: '*****'
//         }
//     });

//     let textToSend = 'Price dropped to ' + price;
//     let htmlText = `<a href=\"${url}\">Link</a>`;

//     let info = await transporter.sendMail({
//         from: '"Price Tracker" <*****@gmail.com>',
//         to: "*****@gmail.com",
//         subject: 'Price dropped to ' + price,
//         text: textToSend,
//         html: htmlText
//     });

//     console.log("Message sent: %s", info.messageId);
// }

// startTracking();