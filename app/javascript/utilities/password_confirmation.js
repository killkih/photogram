document.addEventListener('turbo:load', () => {
    const inputPass = document.querySelector('.input-pass')
    const inputConfPass = document.querySelector('.input-conf-pass')

    if (inputConfPass) {
        checkPasswords(inputPass, inputConfPass)
    }

})

function checkPasswords(inputPass, inputConfPass) {
    const pass = inputPass.querySelector('.pass')
    const confPass = inputConfPass.querySelector('.conf-pass')

    pass.addEventListener('input', () => {
        validPass(pass, confPass)
    })

    confPass.addEventListener('input', () => {
        validPass(pass, confPass)
    })
}

function validPass(pass, confPass) {
    const shortPassAlert = document.querySelector('.short-pass-alert')

    if (pass.value.length > 6){
        shortPassAlert.classList.add('hidden')
    }

    if (confPass.value == '') {
        clearClass(confPass)
    }

    if (pass.value !== confPass.value) {
        clearClass(confPass)
        confPass.classList.add('is-invalid')
    } else {
        clearClass(confPass)
        confPass.classList.add('is-valid')
    }

    if (pass.value.length < 6) {
        clearClass(confPass)
        confPass.classList.add('is-invalid')
        shortPassAlert.classList.remove('hidden')
    }
}

function clearClass(element) {
    element.classList.remove('is-valid')
    element.classList.remove('is-invalid')
}
