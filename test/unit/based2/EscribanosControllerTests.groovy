package based2



import org.junit.*
import grails.test.mixin.*

@TestFor(EscribanosController)
@Mock(Escribanos)
class EscribanosControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/escribanos/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.escribanosInstanceList.size() == 0
        assert model.escribanosInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.escribanosInstance != null
    }

    void testSave() {
        controller.save()

        assert model.escribanosInstance != null
        assert view == '/escribanos/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/escribanos/show/1'
        assert controller.flash.message != null
        assert Escribanos.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/escribanos/list'

        populateValidParams(params)
        def escribanos = new Escribanos(params)

        assert escribanos.save() != null

        params.id = escribanos.id

        def model = controller.show()

        assert model.escribanosInstance == escribanos
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/escribanos/list'

        populateValidParams(params)
        def escribanos = new Escribanos(params)

        assert escribanos.save() != null

        params.id = escribanos.id

        def model = controller.edit()

        assert model.escribanosInstance == escribanos
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/escribanos/list'

        response.reset()

        populateValidParams(params)
        def escribanos = new Escribanos(params)

        assert escribanos.save() != null

        // test invalid parameters in update
        params.id = escribanos.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/escribanos/edit"
        assert model.escribanosInstance != null

        escribanos.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/escribanos/show/$escribanos.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        escribanos.clearErrors()

        populateValidParams(params)
        params.id = escribanos.id
        params.version = -1
        controller.update()

        assert view == "/escribanos/edit"
        assert model.escribanosInstance != null
        assert model.escribanosInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/escribanos/list'

        response.reset()

        populateValidParams(params)
        def escribanos = new Escribanos(params)

        assert escribanos.save() != null
        assert Escribanos.count() == 1

        params.id = escribanos.id

        controller.delete()

        assert Escribanos.count() == 0
        assert Escribanos.get(escribanos.id) == null
        assert response.redirectedUrl == '/escribanos/list'
    }
}
