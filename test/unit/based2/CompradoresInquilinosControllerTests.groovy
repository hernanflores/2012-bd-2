package based2



import org.junit.*
import grails.test.mixin.*

@TestFor(CompradoresInquilinosController)
@Mock(CompradoresInquilinos)
class CompradoresInquilinosControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/compradoresInquilinos/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.compradoresInquilinosInstanceList.size() == 0
        assert model.compradoresInquilinosInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.compradoresInquilinosInstance != null
    }

    void testSave() {
        controller.save()

        assert model.compradoresInquilinosInstance != null
        assert view == '/compradoresInquilinos/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/compradoresInquilinos/show/1'
        assert controller.flash.message != null
        assert CompradoresInquilinos.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/compradoresInquilinos/list'

        populateValidParams(params)
        def compradoresInquilinos = new CompradoresInquilinos(params)

        assert compradoresInquilinos.save() != null

        params.id = compradoresInquilinos.id

        def model = controller.show()

        assert model.compradoresInquilinosInstance == compradoresInquilinos
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/compradoresInquilinos/list'

        populateValidParams(params)
        def compradoresInquilinos = new CompradoresInquilinos(params)

        assert compradoresInquilinos.save() != null

        params.id = compradoresInquilinos.id

        def model = controller.edit()

        assert model.compradoresInquilinosInstance == compradoresInquilinos
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/compradoresInquilinos/list'

        response.reset()

        populateValidParams(params)
        def compradoresInquilinos = new CompradoresInquilinos(params)

        assert compradoresInquilinos.save() != null

        // test invalid parameters in update
        params.id = compradoresInquilinos.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/compradoresInquilinos/edit"
        assert model.compradoresInquilinosInstance != null

        compradoresInquilinos.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/compradoresInquilinos/show/$compradoresInquilinos.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        compradoresInquilinos.clearErrors()

        populateValidParams(params)
        params.id = compradoresInquilinos.id
        params.version = -1
        controller.update()

        assert view == "/compradoresInquilinos/edit"
        assert model.compradoresInquilinosInstance != null
        assert model.compradoresInquilinosInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/compradoresInquilinos/list'

        response.reset()

        populateValidParams(params)
        def compradoresInquilinos = new CompradoresInquilinos(params)

        assert compradoresInquilinos.save() != null
        assert CompradoresInquilinos.count() == 1

        params.id = compradoresInquilinos.id

        controller.delete()

        assert CompradoresInquilinos.count() == 0
        assert CompradoresInquilinos.get(compradoresInquilinos.id) == null
        assert response.redirectedUrl == '/compradoresInquilinos/list'
    }
}
