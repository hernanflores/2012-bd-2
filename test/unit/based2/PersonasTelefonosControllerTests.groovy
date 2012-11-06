package based2



import org.junit.*
import grails.test.mixin.*

@TestFor(PersonasTelefonosController)
@Mock(PersonasTelefonos)
class PersonasTelefonosControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/personasTelefonos/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.personasTelefonosInstanceList.size() == 0
        assert model.personasTelefonosInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.personasTelefonosInstance != null
    }

    void testSave() {
        controller.save()

        assert model.personasTelefonosInstance != null
        assert view == '/personasTelefonos/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/personasTelefonos/show/1'
        assert controller.flash.message != null
        assert PersonasTelefonos.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/personasTelefonos/list'

        populateValidParams(params)
        def personasTelefonos = new PersonasTelefonos(params)

        assert personasTelefonos.save() != null

        params.id = personasTelefonos.id

        def model = controller.show()

        assert model.personasTelefonosInstance == personasTelefonos
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/personasTelefonos/list'

        populateValidParams(params)
        def personasTelefonos = new PersonasTelefonos(params)

        assert personasTelefonos.save() != null

        params.id = personasTelefonos.id

        def model = controller.edit()

        assert model.personasTelefonosInstance == personasTelefonos
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/personasTelefonos/list'

        response.reset()

        populateValidParams(params)
        def personasTelefonos = new PersonasTelefonos(params)

        assert personasTelefonos.save() != null

        // test invalid parameters in update
        params.id = personasTelefonos.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/personasTelefonos/edit"
        assert model.personasTelefonosInstance != null

        personasTelefonos.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/personasTelefonos/show/$personasTelefonos.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        personasTelefonos.clearErrors()

        populateValidParams(params)
        params.id = personasTelefonos.id
        params.version = -1
        controller.update()

        assert view == "/personasTelefonos/edit"
        assert model.personasTelefonosInstance != null
        assert model.personasTelefonosInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/personasTelefonos/list'

        response.reset()

        populateValidParams(params)
        def personasTelefonos = new PersonasTelefonos(params)

        assert personasTelefonos.save() != null
        assert PersonasTelefonos.count() == 1

        params.id = personasTelefonos.id

        controller.delete()

        assert PersonasTelefonos.count() == 0
        assert PersonasTelefonos.get(personasTelefonos.id) == null
        assert response.redirectedUrl == '/personasTelefonos/list'
    }
}
