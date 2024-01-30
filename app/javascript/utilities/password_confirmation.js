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
    if (confPass.value == '') {
        clearClass(confPass)
        return
    }

    if (pass.value !== confPass.value){
        clearClass(confPass)
        confPass.classList.add('is-invalid')
    } else {
        clearClass(confPass)
        confPass.classList.add('is-valid')
    }
}

function clearClass(element) {
    element.classList.remove('is-valid')
    element.classList.remove('is-invalid')
}
